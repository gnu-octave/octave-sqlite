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
## @deftypefn {} {} close (@var{db})
## Close a sqlite connection
##
## Close the previously opened sqlite connection @var{db}.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
## A previously created octave_sqlite object
## @end table
##
## @subsubheading Outputs
## None
##
## @seealso{sqlite, isopen}
## @end deftypefn

function close (db)
  __sqlite_close__(db);
endfunction

%!test
%! testfile = file_in_loadpath("data/bookdb.db");
%! db = sqlite(testfile, "readonly");
%! assert(isopen(db));
%! close (db);
%! assert(!isopen(db));
