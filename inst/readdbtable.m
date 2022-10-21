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
## @deftypefn {} {@var{t} =} readdbtable (@var{filename})
## Create a dbtable from a file
##
## Currently, this is using a very simplistic approach to read data from a CSV
## formatted file only.
## 
## @subsubheading Inputs
## @table @asis
## @item @var{filename} 
## Filename for file containing tabular data
## @end table
##
## @subsubheading Outputs
## @table @asis
## @item @var{t} 
## a dbtable of the read data
## @end table
##
## @end deftypefn

function t = readdbtable (filename, varargin)
  if nargin < 0 || !ischar(filename)
    error ("Expected filename as a string");
  endif
    
  [~, ~, ext] = fileparts(filename);

  if isempty(ext)
    ext = "";
  endif

  switch tolower(ext)
    case { ".txt" ".csv" ".dat" }
      format = "csv";
    otherwise
      format = "unknown";
  endswitch

  if strcmp(format, "csv")
    t = read_dbtable_csv(filename);
  else
    error ("Unknown format for filename");
  endif

endfunction

%!error readbtable()

%!test
%! testfile = [tempname ".csv"];
%! fd = fopen(testfile, "w+t");
%! unwind_protect
%!   fprintf(fd, "Column1,Column2,Column3\n");
%!   fprintf(fd, "Line1,1,2\n");
%!   fprintf(fd, "Line2,2,\n");
%!   fprintf(fd, "Line3,3\n");
%!   fprintf(fd, "Line4,4\n");
%!   fprintf(fd, "\n");
%!   fclose(fd);
%!   fd = -1;
%!
%!   t = readdbtable(testfile);
%!   assert(istable(t));
%!   assert(size(t), [4 3]);
%!   assert(t.Properties.VariableNames, {'Column1', 'Column2', 'Column3'});
%! unwind_protect_cleanup
%!   if fd >= 0
%!     fclose(fd);
%!   endif
%!   delete(testfile);
%! end_unwind_protect

