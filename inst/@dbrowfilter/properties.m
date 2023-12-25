## Copyright (C) 2023 John Donoghue
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
## @deftypefn {} {&var{props} =} properties (@var{rf})
## Return the properties (row variables) of the filter
## @seealso{dbrowfilter}
## @end deftypefn

function props = properties(this)
  # in octave <= 6.4, 'properties' cant t be be used as a function name
  # otherwise will be a syntax error, so currently using separate file for the function
  props = this.vars;
endfunction
