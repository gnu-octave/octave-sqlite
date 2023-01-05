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
AC_INIT([Octave sqlite], [0.0.2])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIRS([m4])
AH_TOP([#include "undef-ah-octave.h"])

AC_CANONICAL_HOST
AC_CANONICAL_TARGET

AC_PROG_SED
AC_PROG_GREP

AC_CHECK_TOOL([MKOCTFILE], [mkoctfile], [none])
if [ test "x$MKOCTFILE" = "xnone" ]; then
  AC_MSG_ERROR([*** 'mkoctfile' not found.])
fi
AC_CHECK_TOOL([OCTAVE_CONFIG], [octave-config] ,[])
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

dnl since we Octave 6+, there are not many types that have changed
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
  [octave_base_value],
  [octave_base_dld_value],
  [[octave_base_dld_value tmp();]],
  [OCTAVE_BASE_CLASS],
  [],
  []
]

],[oct-alt-includes.h])

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
