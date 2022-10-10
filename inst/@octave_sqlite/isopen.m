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
## @deftypefn {} {@var{yesno} =} isopen (@var{db})
## Return true if the sqlite connection is open.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
##  previously opened sqlite database.
## @end table
##
## @subsubheading Outputs
## @table @asis
## @item @var{yesno}
##  Boolean for if the database is still open.
## @end table
##
## @seealso{sqlite, close}
## @end deftypefn

function ret = isopen (db)
  ret = db.IsOpen;
endfunction

%!test
%! testfile = file_in_loadpath("data/bookdb.db");
%! db = sqlite(testfile, "readonly");
%! assert(isopen(db));
%! close (db);
%! assert(!isopen(db));
