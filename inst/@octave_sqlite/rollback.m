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
## @deftypefn {} {} rollback (@var{db})
## Rollback pending transactions of sqlite connection.
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
## @seealso{sqlite, commit}
## @end deftypefn

function rollback (db)
  __sqlite_rollback__(db);
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
%!   rollback(db);
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
