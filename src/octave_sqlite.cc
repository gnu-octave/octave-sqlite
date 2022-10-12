// Copyright (C) 2022 John Donoghue <john.donoghue@ieee.org>
//
// This program is free software; you can redistribute it and/or modify it under
// the terms of the GNU General Public License as published by the Free Software
// Foundation; either version 3 of the License, or (at your option) any later
// version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
// FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
// details.
//
// You should have received a copy of the GNU General Public License along with
// this program; if not, see <http://www.gnu.org/licenses/>.

// Octave Includes
#include <octave/oct.h>

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif

#include "octave_sqlite.h"

#include <octave/oct-map.h>

#include <octave/quit.h>

static std::string
error_string(sqlite3 *db, int code)
{
  std::string errstr = "";

  if(code == 0) return "";

  const char *err = sqlite3_errmsg(db);
  if(err)
    errstr = std::to_string(code) + ": " + std::string(err);
  else
    errstr = std::to_string(code);

  return errstr;
}


#ifdef DEFINE_OCTAVE_ALLOCATOR 
DEFINE_OCTAVE_ALLOCATOR (octave_sqlite);
#endif
DEFINE_OV_TYPEID_FUNCTIONS_AND_DATA (octave_sqlite, "octave_sqlite", "octave_sqlite");

octave_sqlite::octave_sqlite ()
 : fieldnames(4)
{
  //client = 0;
  fieldnames[0] = "Database";
  fieldnames[1] = "IsOpen";
  fieldnames[2] = "IsReadOnly";
  fieldnames[3] = "AutoCommit";

  db = 0;
  autocommit = "on";
  commit_count = 0;
}

octave_sqlite::octave_sqlite (const octave_sqlite &s)
{
  // should never be called
  db = 0;
  fieldnames = s.fieldnames;
}

octave_sqlite::~octave_sqlite(void)
{
  close ();
}

octave_base_value *
octave_sqlite::empty_clone (void) const 
{
  return new octave_sqlite();
}

octave_base_value *
octave_sqlite::clone (void) const 
{
  return new octave_sqlite (*this);
}

octave_base_value *
octave_sqlite::unique_clone (void) 
{
  count++;
  return this;
}

void
octave_sqlite::print (std::ostream& os, bool pr_as_read_syntax) const
{
  print_raw (os, pr_as_read_syntax);
  newline (os);
}

void
octave_sqlite::print (std::ostream& os, bool pr_as_read_syntax)
{
  print_raw (os, pr_as_read_syntax);
  newline (os);
}

void
octave_sqlite::print_raw (std::ostream& os, bool pr_as_read_syntax) const
{
  os << "  sqlite with properties"; newline (os);
  os << "      Database: " << filename; newline(os);
  os << "    IsReadOnly: " << (mode == "readonly"); newline(os);
  os << "    AutoCommit: " << autocommit; newline(os);
}

octave_value_list
octave_sqlite::subsref (const std::string& type, const std::list<octave_value_list>& idx, int nargout)
{
  octave_value_list retval;
  int skip = 1;

  switch (type[0])
    {
    default:
      error ("octave_sqlite object cannot be indexed with %c", type[0]);
      break;
    case '.':
      {
        std::string prop = (idx.front ()) (0).string_value();
	if (prop == "Database")
	  retval(0) = filename;
	else if (prop == "IsOpen")
	  retval(0) = octave_value(db != 0);
	else if (prop == "IsReadOnly")
	  retval(0) = octave_value(mode == "readonly");
	else if (prop == "AutoCommit")
	  retval(0) = autocommit;
	else
	  error ("Unkown property '%s'", prop.c_str());
      }
      break;
    }

  if (idx.size () > 1 && type.length () > 1)
    retval = retval (0).next_subsref (nargout, type, idx, skip);

  return retval;
}

octave_value
octave_sqlite::subsasgn (const std::string& type, const std::list<octave_value_list>& idx, const octave_value& rhs)
{
  octave_value retval;

  switch (type[0])
    {
    default:
      error ("octave_sqlite object cannot be indexed with %c", type[0]);
      break;

    // Only AutoCommit property isnt readonly
    case '.':
      if (type.length () == 1)
        {
          octave_value prop = (idx.front ()) (0);
	  if (!prop.is_string() || prop.string_value() != "AutoCommit")
	    {
              error ("octave_sqlite Unknown property");
	    }
	  else if(!rhs.is_string() || (rhs.string_value() != "on" && rhs.string_value() != "off"))
	  {
              error ("Expected AUtoCommit as 'on' or 'off'");

	  }
	  else
	  {
	    std::string  newautocommit = rhs.string_value();

	    if (newautocommit != autocommit)
	    {
              if (newautocommit == "off")
	      {
		if(begin())
	          autocommit = newautocommit;
	      }
              if (newautocommit == "on")
	      {
                // TODO: do we commit or rollback if go from on to off with stuff there ?
		if (have_pending_commits())
		  error ("Pending commits need to be commited or rolledback before changing commit state");
                else
		{
		  rollback(); // should be nothing to reject really, but need to get out of transaction state
	          autocommit = newautocommit;
		}
	      }
            }
            count++;
            retval = octave_value (this);
	  }
        }
      else
        {
          error ("octave_sqlite invalid index");
        }
    }
  return retval;
}

bool
octave_sqlite::create (const std::string &infilename, const std::string &inmode)
{
  if (db)
    {
      error ("sqlite: database is already open\n");
      return false;
    }

  filename = infilename;
  mode = inmode;
  autocommit = "on";
  commit_count = 0;

  int rc = 0;

  int flags = 0;
  if (mode == "readonly")
    flags = SQLITE_OPEN_READONLY;
  else if (mode == "create")
    flags = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE;
  else
    flags = SQLITE_OPEN_READWRITE;

  rc = sqlite3_open_v2(filename.c_str(), &db, flags, NULL);

  if(rc)
    {
      sqlite3_close(db);
      error("Failed to open '%s' - %s", filename.c_str(), error_string(db, rc).c_str());
      return false;
    }

  return true;
}

void
octave_sqlite::close (void)
{
  if (db)
  {
    sqlite3_close(db);
    db = 0;
  }
}

bool
octave_sqlite::rollback (void)
{
  if (db)
  {
    if (!sqlite3_get_autocommit(db))
    {
      char * err;
      int res = sqlite3_exec(db, "ROLLBACK", NULL, NULL, &err);
      if (res != 0)
        {
          error ("error in rollback - %s", err ? err : ""); 
        }
      else
	// does this auto toggle ?
	autocommit = "on";
      if (err)
        sqlite3_free(err);

      return res == 0;
    }
 
  }
  return false;
}

bool
octave_sqlite::begin (void)
{
  if (db)
  {
    if (!sqlite3_get_autocommit(db))
    {
      printf("Already in transaction\n");
    }
    else
    {
      char * err;
      int res = sqlite3_exec(db, "BEGIN", NULL, NULL, &err);
      if (res != 0)
        {
          error ("error starting transaction - %s", err ? err : ""); 
        }
      else
      {
         //commit_count = sqlite3_total_changes64(db);
         commit_count = sqlite3_total_changes(db);
      }

      if (err)
        sqlite3_free(err);

      return res == 0;
    }
  }
  return false;
}

bool
octave_sqlite::commit (void)
{
  if (db)
  {
    if (!sqlite3_get_autocommit(db))
    {
      char * err;
      int res = sqlite3_exec(db, "COMMIT", NULL, NULL, &err);
      if (res != 0)
        {
          error ("error commiting - %s", err ? err : ""); 
        }
      else
	// does this auto toggle ?
	autocommit = "on";
      if (err)
        sqlite3_free(err);

      return res == 0;
    }
  }
  return false;
}

bool
octave_sqlite::have_pending_commits (void)
{
  if (db)
  {
    if(sqlite3_get_autocommit(db) == 0)
    {
      //sqlite3_int64 v = sqlite3_total_changes64(db);
      sqlite3_int64 v = sqlite3_total_changes(db);
      return v != commit_count;
    }
  }
  return false;
}

bool octave_sqlite::execute (const std::string &query)
{
  char * err;
  int res = sqlite3_exec(db, query.c_str(), NULL, NULL, &err);
  if (res != 0)
    {
      error ("error executing statement `%s` - %s", query.c_str(), err ? err : ""); 
    }
  if (err)
    sqlite3_free(err);
  return res == 0;
}

bool octave_sqlite::fetch (const std::string &query, octave_value &retval)
{
  sqlite3_stmt *stmt;
  
  int rc = sqlite3_prepare_v2(db, query.c_str(), -1, &stmt, NULL);
  if(rc != SQLITE_OK)
    {
      error ("error preparing statement %s", error_string(db, rc).c_str()); 
      return false;
    }

  int num_columns = sqlite3_column_count(stmt);

  if (num_columns > 0)
  {
    octave_map om;
    Cell coldata[num_columns];
    
    int src = 0;
    int row = 0;
    do {
      src = sqlite3_step(stmt);
      if (src == SQLITE_ROW)
        {

          for (int i=0;i<num_columns;i++)
            {
              int type = sqlite3_column_type(stmt, i);

	      if (coldata[i].numel() <= row)
                {
                  coldata[i].resize(dim_vector(row+20, 1));
                }

              if (type == SQLITE_INTEGER || type == SQLITE_FLOAT)
                {
                  double v = sqlite3_column_double(stmt, i);
                  coldata[i](row) = octave_value(v);
                }
              else if (type == SQLITE_NULL)
                {
                  coldata[i](row) = octave_value(Matrix());
                }
              else if (type == SQLITE_BLOB)
                {
                  int sz = sqlite3_column_bytes(stmt, i);
                  octave_uint8 *blob = (octave_uint8*)sqlite3_column_blob(stmt, i);
                  if (blob)
                    {
                      intNDArray<octave_uint8> blobarr(dim_vector(1,sz));
                      for (int i=0;i<sz;i++)
                        blobarr(i) = blob[i];

                      coldata[i](row) = octave_value(blobarr);
                    }
                  else
                    {
                      coldata[i](row) = octave_value(Matrix());
                    }
                }
              else
                {
                  const char * text = (const char*)sqlite3_column_text(stmt, i);

                  coldata[i](row) = octave_value(text);
                }
            } // for col
          row ++;
        }
      else if (src != SQLITE_DONE)
        {
          rc = src;
        }
    } while(src == SQLITE_ROW);

    if (rc == 0)
      {
        for (int i=0;i<num_columns;i++)
          {
            // actual used size
            coldata[i].resize(dim_vector(row, 1));
      
            const char *name = sqlite3_column_name(stmt, i);
            om.assign(name, octave_value(coldata[i]));
           }

        retval = om;
      }
    }
  else
    {
     rc = sqlite3_step(stmt);
    }

  if (rc != 0)
    {
      error ("error executing statement %s",  error_string(db, rc).c_str()); 
    }

  sqlite3_finalize(stmt);

  return rc == 0;
}

static bool type_loaded = false;

void
init_types(void)
{
  if (!type_loaded)
    {
     octave_sqlite::register_type ();
     type_loaded = true;
    }
}
