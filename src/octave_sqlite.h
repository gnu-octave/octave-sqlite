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
#ifndef OCTAVE_SQLITE_H
#define OCTAVE_SQLITE_H

// Octave Includes
#include <octave/oct.h>

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif

#ifdef HAVE_OCTAVE_OCT_TIME_H
# include <octave/oct-time.h>
#endif

// string
#include <string>

#include <iostream>

#include <errno.h>
#include <map>

#include <sqlite3.h>

void init_types(void);

class octave_sqlite : public OCTAVE_BASE_CLASS
{
public:
  /**
   * default constructor 
   */
  octave_sqlite ();

  /**
   * create object
   */
  octave_sqlite (const std::string &filename, const std::string &mode);

  /**
   * deconstructor
   */
  ~octave_sqlite (void);

  // interface functions
  bool create (const std::string &filename, const std::string &mode);
  void close (void);
  bool execute (const std::string &query);
  bool fetch (const std::string &query, octave_value &retval);

  bool rollback (void);
  bool commit (void);
  bool begin (void);
  bool have_pending_commits (void);

  /**
   * Various properties of the octave_base_value datatype.
   */
  bool is_constant (void) const { return true;}
  bool is_defined (void) const { return true;}
  bool is_object (void) const { return true; }

  // required to use subsasn
  string_vector map_keys (void) const { return fieldnames; }
  dim_vector dims (void) const { static dim_vector dv(1, 1); return dv; }

  octave_base_value * clone (void) const;
  octave_base_value * empty_clone (void) const;
  octave_base_value * unique_clone (void);

 /**
  * Overloaded methods to print
  */
  void print (std::ostream& os, bool pr_as_read_syntax = false) const;
  void print (std::ostream& os, bool pr_as_read_syntax = false); 
  void print_raw (std::ostream& os, bool pr_as_read_syntax) const;

 /**
  * overloaded methods to get properties
  */
  octave_value_list subsref (const std::string& type, const std::list<octave_value_list>& idx, int nargout);

  octave_value subsref (const std::string& type, const std::list<octave_value_list>& idx)
  {
    octave_value_list retval = subsref (type, idx, 1);
    return (retval.length () > 0 ? retval(0) : octave_value ());
  }

  octave_value subsasgn (const std::string& type, const std::list<octave_value_list>& idx, const octave_value& rhs);

private:
  octave_sqlite (const octave_sqlite &);

  sqlite3 *db;

  sqlite3_int64 commit_count;

  std::string filename;
  std::string mode;
  std::string autocommit;

  string_vector fieldnames;
#ifdef DECLARE_OCTAVE_ALLOCATOR
  DECLARE_OCTAVE_ALLOCATOR
#endif
  DECLARE_OV_TYPEID_FUNCTIONS_AND_DATA
};

#endif // OCTAVE_SQLITE_H
