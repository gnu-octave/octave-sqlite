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
## @deftypefn {} {} commit (@var{db})
## Commit changes to a database
##
## Commit pending transactions of sqlite connection that has AutoCommit = off set.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
## Previously created octave_sqlite object
## @end table
##
## @subsubheading Outputs
## None
##
## @subsubheading Examples
## Create a database table turn off autocommit and insert a row and commit
## @example
## @code {
## # create sql connection
## db = sqlite("mytest.db");
## # create table
## execute(db, 'CREATE TABLE Test (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT)');
## # turn off auto commit
## db.AutoCommit = "off";
## execute(db, 'INSERT INTO Test (Name) VALUES ("Line1")');
## # commit the insert
## commit(db);
## }
## @end example
##
## @seealso{sqlite, rollback}
## @end deftypefn

function commit (db)
  __sqlite_commit__(db);
endfunction

%!test
%! testfile = tempname;
%! unwind_protect
%!   db = sqlite(testfile, "create");
%!   execute(db, 'CREATE TABLE Test (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT)');
%!   execute(db, 'INSERT INTO Test (Name) VALUES ("Line1")');
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [1 2]);
%!   db.AutoCommit = 'off';
%!   execute(db, 'INSERT INTO Test (Name) VALUES ("Line2")');
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [2 2]);
%!   close(db);
%!
%!   db = sqlite(testfile);
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [1 2]);
%!   db.AutoCommit = 'off';
%!   execute(db, 'INSERT INTO Test (Name) VALUES ("Line2")');
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [2 2]);
%!   commit(db);
%!   close(db);
%!
%!   db = sqlite(testfile);
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [2 2]);
%!   close(db);
%!
%! unwind_protect_cleanup
%!   db = 0;
%!   
%!   if exist(testfile, "file")
%!     delete(testfile);
%!   endif
%! end_unwind_protect
