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
## @deftypefn {} {@var{t} =} struct2dbtable (@var{astruct})
## Create a table from a struct
## 
## If a table function exists, use it to create the table, otherwise, use the 
## dbtable type to create it.
##
## @subsubheading Inputs:
## @table @asis
## @item @var{astruct} 
## A struct with same number of elements in each field
## @end table
##
## @subsubheading Outputs:
## @table @asis
## @item @var{t} 
## a table (if table exists) or dbtable of the @var{astruct} data
## @end table
##
## @end deftypefn

function t = struct2dbtable (astruct)
  if ! isstruct(astruct)
    error ("Not a struct");
  endif

  names = fieldnames(astruct);
  values = struct2cell(astruct);

  if exist("table") == 2
    t = table (values{:}, 'VariableNames', names);
  else
    t = dbtable (values{:}, 'VariableNames', names');
  endif
endfunction

%!test
%! s = struct('a', [1;2;3], 'b', [2;4;6]);
%! t = struct2dbtable(s);
%! assert(istable(t));
%! assert(size(t), [3 2]);
%! assert(t.Properties.VariableNames, {'a', 'b'});
%! assert(t.a, [1;2;3]);

%!error <Not a struct> struct2dbtable(1);

%!error <Not a struct> struct2dbtable('hello');

