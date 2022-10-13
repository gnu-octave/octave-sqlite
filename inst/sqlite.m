## Copyright (C) 2022 John Donoghue <john.donoghue@ieee.org>
##
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{db} =} sqlite (@var{filename})
## @deftypefnx {} {@var{db} =} sqlite (@var{filename}, @var{mode})
## Create a sqlite database connection
##
## @subsubheading Inputs
## @table @code
## @item @var{filename}
## Filename of the sqlite database
## @item @var{mode}
## mode for the sqlite access 'readonly', 'connect' (default), 'create'.
## @end table
##
## @subsubheading Outputs
## @table @code
## @item @var{db}
## a opened SQLITE database as a octave_sqlite object
## @end table
##
## @subsubheading Object Properties
## The octave_sqlite object has the following properties:
##
## @table @asis
## @item Database
## The name of the opened database file (readonly)
## @item IsOpen
## Boolean field for if the database is currently open (readonly)
## @item IsReadOnly
## Boolean field for if the database was opened in readonly mode. (readonly)
## @item AutoCommit
## String flag field for whether database is in auto commit mode. "on" (default) or "off".
## @end table
##
## @subsubheading Examples
## Open a sqlite database, failing if it does not exist.
## @example
## @code {
## db = sqlite("mytest.db");
## }
## @end example
##
## Open a sqlite database, creating it if it does not exist.
## @example
## @code {
## db = sqlite("mytest.db", "create");
## }
## @end example
##
## @end deftypefn

function obj = sqlite(varargin)

  if (nargin == 0 || nargin > 2)
    error ("Expects filename and optional mode");
  endif

  filename = varargin{1};
  mode = "connect";

  if nargin > 1
    mode = varargin{2};
  endif

  if !ischar(filename)
    error ("Expected filename as a string");
  endif

  if !ischar(mode) || !strcmp(mode, {"readonly", "connect", "create"})
    error ("Expected mode as string 'readonly', 'connect', 'create'.");
  endif

  obj = __sqlite_create__(filename, mode);
endfunction

%!error <Expects filename and optional mode> sqlite ();

%!error <Expected filename as a string> sqlite (1);

%!error <Expected mode as string> sqlite ("test", 1);

%!test
%! testfile = file_in_loadpath("data/bookdb.db");
%! db = sqlite(testfile, "readonly");
%! # check property access
%! db.AutoCommit = "off";
%! db.AutoCommit = "on";
%! close(db);

%!test
%! testfile = tempname;
%! unwind_protect
%!   db = sqlite(testfile, "create");
%!   assert(isopen(db));
%!   close(db);
%! unwind_protect_cleanup
%!   db = 0;
%!   
%!   if exist(testfile, "file")
%!     delete(testfile);
%!   endif
%! end_unwind_protect
