## Copyright (C) 2022 John Donoghue
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or (at
## your option) any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {} execute (@var{db}, @var{sqlquery})
## Execute non select SQL query @var{sqlquery} on a sqlite database.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
## Previously created octave_sqlite object
## @item @var{sqlquery}
## A valid non selecting SQL query string
## @end table
##
## @subsubheading Inputs
## None
##
## @subsubheading Examples
## Create a database table and insert a row
## @example
## @code {
## # create sql connection
## db = sqlite("mytest.db");
## # create table and then insert a row
## execute(db, 'CREATE TABLE Test (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT)');
## execute(db, 'INSERT INTO Test (Name) VALUES ("Line1")');
## }
## @end example
##
## @seealso{sqlite, fetch}
## @end deftypefn

function execute (db, query)
  if nargin < 2
    print_usage();
  endif
  if !ischar(query)
    error ("Expected sqlquery as a string");
  endif
  __sqlite_execute__(db, query);
endfunction

%!test
%! testfile = tempname;
%! unwind_protect
%!   db = sqlite(testfile, "create");
%!   execute(db, 'CREATE TABLE Test (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT)');
%!   execute(db, 'INSERT INTO Test (Name) VALUES ("Line1")');
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [1 2]);
%!   close(db);
%! unwind_protect_cleanup
%!   db = 0;
%!   
%!   if exist(testfile, "file")
%!     delete(testfile);
%!   endif
%! end_unwind_protect
