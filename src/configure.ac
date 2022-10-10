#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
#
### Copyright (C) 2022 John Donoghue <john.donoghue@ieee.org>
###
### This program is free software; you can redistribute it and/or
### modify it under the terms of the GNU General Public License as
### published by the Free Software Foundation; either version 3 of the
### License, or (at your option) any later version.
###
### This program is distributed in the hope that it will be useful,
### but WITHOUT ANY WARRANTY; without even the implied warranty of
### MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
### General Public License for more details.
###
### You should have received a copy of the GNU General Public License
### along with this program; if not, see
### <http://www.gnu.org/licenses/>.

AC_PREREQ([2.67])
AC_INIT([Octave sqlite], [0.0.1])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIRS([m4])
AH_TOP([#include "undef-ah-octave.h"])

AC_CANONICAL_HOST
AC_CANONICAL_TARGET

AC_PROG_SED
AC_PROG_GREP

AC_PATH_PROG([MKOCTFILE], [mkoctfile])
if test -z "$MKOCTFILE"; then
  AC_MSG_ERROR([*** 'mkoctfile' not found.])
fi
AC_CHECK_PROG(OCTAVE_CONFIG,octave-config,octave-config)
test -z "$OCTAVE_CONFIG" && OCTAVE_CONFIG=$MKOCTFILE

CXX=`${MKOCTFILE} -p CXX`
save_CXX="$CXX"
AC_PROG_CXX
AC_PROG_CXXCPP

AC_LANG(C++)

# check can access std c files
AC_CHECK_HEADERS([string.h])

#AX_PTHREAD([],[AC_MSG_ERROR([thread library is needed to install $PACKAGE_NAME])])

## octave API tests
save_CXX="$CXX"
save_CXXFLAGS="$CXXFLAGS"
save_LIBS="$LIBS"
save_LDFLAGS="$LDFLAGS"

CXX=`${MKOCTFILE} -p CXX`
OCTINCLUDEDIR=${OCTINCLUDEDIR:-`$MKOCTFILE -p INCFLAGS`}
OCTLIBDIR=${OCTLIBDIR:-`$MKOCTFILE -p OCTLIBDIR`}
CXXFLAGS="$OCTINCLUDEDIR $CXXFLAGS"
LDFLAGS="-L$OCTLIBDIR $LDFLAGS"
LIBS="-loctinterp $LIBS"

# includes
AC_CHECK_HEADERS([octave/interpreter.h octave/oct-time.h],
  [],
  [],
  [#include <octave/oct.h>]
)

# need to use interpreter->get_load_path in dev version of octave,
# prior to that methods of load_path were static
AC_CACHE_CHECK(
  [interpreter get_load_path],
  [octave_cv_interpreter_get_load_path],
  [AC_COMPILE_IFELSE(
    [AC_LANG_PROGRAM([
      #include <octave/oct.h>
      #include <octave/octave.h>
      #include <octave/interpreter.h>
      #include <octave/load-path.h>
      ],
      [
        octave::load_path &p = octave::interpreter::the_interpreter ()->get_load_path ();
      ])],
    [octave_cv_interpreter_get_load_path=yes],
    [octave_cv_interpreter_get_load_path=no])
  ])
if test "$octave_cv_interpreter_get_load_path" = "yes" ; then
  AC_DEFINE(HAVE_OCTAVE_LOAD_PATH,[1],[Whether we have the interpreter load path])
fi

dnl NOTE: most of these are to handle octave < 4.0 so probally not needed
OF_OCTAVE_LIST_ALT_SYMS([

[dnl
  [feval],
  [octave::feval],
  [[octave::feval ("date");]],
  [OCTAVE__FEVAL],
  [[#include <octave/parse.h>]],
  [[#include <octave/parse.h>]]
],

[dnl
  [octave_time],
  [octave::sys::time],
  [[octave::sys::time t;]],
  [OCTAVE__TIME],
  [[#include <octave/oct-time.h>]],
  [[#include <octave/oct-time.h>]]
],

[dnl
  [is_float_type],
  [isfloat],
  [[octave_value ().isfloat ();]],
  [OV_ISFLOAT],
  [],
  []
],

[dnl
  [is_integer_type],
  [isinteger],
  [[octave_value ().isinteger ();]],
  [OV_ISINTEGER],
  [],
  []
],

[dnl
  [is_bool_type],
  [islogical],
  [[octave_value ().islogical ();]],
  [OV_ISLOGICAL],
  [],
  []
],

[dnl
  [octave_base_value],
  [octave_base_dld_value],
  [[octave_base_dld_value tmp();]],
  [OCTAVE_BASE_CLASS],
  [],
  []
],

[dnl
  [octave_execution_exception],
  [octave::execution_exception],
  [[octave::execution_exception err;]],
  [OCTAVE_EXECUTION_EXCEPTION],
  [#include <octave/quit.h>],
  [#include <octave/quit.h>]
]

],[oct-alt-includes.h])

# check if method of getting execution exception message
AC_MSG_CHECKING([for execution_exception message field])
octave_execution_field=none
AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
   #include <octave/oct.h>
   #include <octave/quit.h>
  ]], [
    OCTAVE_EXECUTION_EXCEPTION err; err.message();
  ])],
 [octave_execution_field=message],
 [
   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
     #include <octave/oct.h>
     #include <octave/quit.h>
    ]], [
      OCTAVE_EXECUTION_EXCEPTION err; err.info();
    ])],
    [octave_execution_field=info],
    [])
 ]
)
AC_MSG_RESULT([$octave_execution_field])
AC_DEFINE_UNQUOTED([OCTAVE_EXCEPTION_MESSAGE],$octave_execution_field,[execution_exception message field])

if test $octave_execution_field != none; then
AC_DEFINE([HAS_OCTAVE_EXCEPTION_MESSAGE],[1],[has some kid of execution_exception message field])
fi

CC=$save_CXX
CXXFLAGS=$save_CXXFLAGS
LIBS="$save_LIBS"
LDFLAGS="$save_LDFLAGS"

# look for sqlite
save_LDFLAGS=$LDFLAGS
save_CPPFLAGS=$CPPFLAGS
save_LIBS=$LIBS

PKG_CHECK_MODULES([SQLITE], [sqlite3])
SQLITE_LIBDIR="`"$PKG_CONFIG" sqlite3 --variable libdir`"
AC_SUBST([SQLITE_LIBDIR])

if test "x$SQLITE_LIBS" == "x"; then
  AC_MSG_ERROR([sqlite3 is required to install $PACKAGE_NAME])
fi

## restore
CPPFLAGS=$save_CPPFLAGS
LDFLAGS=$save_LDFLAGS
LIBS="$save_LIBS"

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
