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

#include <octave/oct.h>
#include <octave/ov.h>
#include <octave/defun-dld.h>

#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif

#ifdef HAVE_OCTAVE_INTERPRETER_H
# include <octave/interpreter.h>
#endif

// PKG_ADD: autoload ("__sqlite_pkg_lock__", "__sqlite__.oct");
// PKG_ADD: __sqlite_pkg_lock__(1);
// PKG_DEL: __sqlite_pkg_lock__(0);
#ifdef DEFMETHOD_DLD
DEFMETHOD_DLD (__sqlite_pkg_lock__, interp, args, , "internal function")
{
  octave_value retval;
  if (args.length () >= 1)
    {
      if (args(0).int_value () == 1)
        interp.mlock();
      else if (args(0).int_value () == 0 &&  interp.mislocked("__sqlite_pkg_lock__"))
        interp.munlock("__sqlite_pkg_lock__");
    }
  return retval;
}
#else
DEFUN_DLD(__sqlite_pkg_lock__, args, ,  "internal function")
{
  octave_value retval;
  return retval;
}
#endif
