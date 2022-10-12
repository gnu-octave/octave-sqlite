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

#include <iostream>
#include <sstream>
#include <ctype.h>
#include <cmath>
#include <octave/oct.h>
#include <octave/version.h>
#include <octave/defun-dld.h>

#include "octave/ov-struct.h"

#ifdef HAVE_CONFIG_H
#  include "./config.h"
#endif

#ifdef HAVE_OCTAVE_INTERPRETER_H
# include <octave/interpreter.h>
#endif

#include "octave_sqlite.h"


// PKG_ADD: autoload ("__sqlite_create__", "__sqlite__.oct");
DEFUN_DLD(__sqlite_create__, args, nargout,
"-*- texinfo -*-\n \
@deftypefn {Function File} {} __sqlite_create__\n \
Private function\n \
@end deftypefn")
{
  if ( args.length() != 2 || !args (0).is_string () || !args (1).is_string ())
    {
      print_usage ();
      return octave_value();
    }
  std::string filename = args (0).string_value();
  std::string mode = args (1).string_value();

  init_types ();

  octave_sqlite * retvalue = new octave_sqlite ();

  if ( retvalue->create (filename, mode) == false )
    {
      delete retvalue;
      return octave_value ();
    }

  return octave_value (retvalue);
}

// PKG_ADD: autoload ("__sqlite_close__", "__sqlite__.oct");
DEFUN_DLD(__sqlite_close__, args, nargout,
"-*- texinfo -*-\n \
@deftypefn {Function File} {} __sqlite_close__\n \
Private function\n \
@end deftypefn")
{
  init_types ();

  if (args.length () != 1 || 
      args(0).type_id () != octave_sqlite::static_type_id ())
    {
      print_usage ();
      return octave_value (false);  
    }

  octave_sqlite * db = NULL;

  const octave_base_value& rep = args (0).get_rep ();

  db = &((octave_sqlite &)rep);

  db->close();

  return octave_value (true);
}

// PKG_ADD: autoload ("__sqlite_execute__", "__sqlite__.oct");
DEFUN_DLD(__sqlite_execute__, args, nargout,
"-*- texinfo -*-\n \
@deftypefn {Function File} {} __sqlite_execute__\n \
Private function\n \
@end deftypefn")
{
  init_types ();

  if (args.length () != 2 || 
      args(0).type_id () != octave_sqlite::static_type_id ())
    {
      print_usage ();
      return octave_value (false);  
    }
  if (!args(1).is_string ())
    {
      error ("Expected sqlquery as a string");
      return octave_value (false);  
    }

  octave_sqlite * db = NULL;

  const octave_base_value& rep = args (0).get_rep ();

  db = &((octave_sqlite &)rep);

  return octave_value(db->execute(args(1).string_value()));
}

// PKG_ADD: autoload ("__sqlite_fetch__", "__sqlite__.oct");
DEFUN_DLD(__sqlite_fetch__, args, nargout,
"-*- texinfo -*-\n \
@deftypefn {Function File} {} __sqlite_fetch__\n \
Private function\n \
@end deftypefn")
{
  init_types ();

  if (args.length () != 2 || 
      args(0).type_id () != octave_sqlite::static_type_id ())
    {
      print_usage ();
      return octave_value (false);  
    }
  if (!args(1).is_string ())
    {
      error ("Expected sqlquery as a string");
      return octave_value (false);  
    }

  octave_sqlite * db = NULL;

  const octave_base_value& rep = args (0).get_rep ();

  db = &((octave_sqlite &)rep);

  octave_value m;
  bool res = db->fetch(args(1).string_value(), m);

  if(res)
    return m;
  else
    return octave_value();
}

// PKG_ADD: autoload ("__sqlite_commit__", "__sqlite__.oct");
DEFUN_DLD(__sqlite_commit__, args, nargout,
"-*- texinfo -*-\n \
@deftypefn {Function File} {} __sqlite_commit__\n \
Private function\n \
@end deftypefn")
{
  init_types ();

  if (args.length () != 1 || 
      args(0).type_id () != octave_sqlite::static_type_id ())
    {
      print_usage ();
      return octave_value (false);  
    }

  octave_sqlite * db = NULL;

  const octave_base_value& rep = args (0).get_rep ();

  db = &((octave_sqlite &)rep);

  octave_value m;
  bool res = db->commit();

  return octave_value(res);
}

// PKG_ADD: autoload ("__sqlite_rollback__", "__sqlite__.oct");
DEFUN_DLD(__sqlite_rollback__, args, nargout,
"-*- texinfo -*-\n \
@deftypefn {Function File} {} __sqlite_rollback__\n \
Private function\n \
@end deftypefn")
{
  init_types ();

  if (args.length () != 1 || 
      args(0).type_id () != octave_sqlite::static_type_id ())
    {
      print_usage ();
      return octave_value (false);  
    }

  octave_sqlite * db = NULL;

  const octave_base_value& rep = args (0).get_rep ();

  db = &((octave_sqlite &)rep);

  octave_value m;
  bool res = db->rollback();

  return octave_value(res);
}

#if 0
%!assert(exist("__sqlite_create__"), 3)
%!assert(exist("__sqlite_close__"), 3)
%!assert(exist("__sqlite_execute__"), 3)
%!assert(exist("__sqlite_fetch__"), 3)
%!assert(exist("__sqlite_rollback__"), 3)
%!assert(exist("__sqlite_commit__"), 3)
#endif
