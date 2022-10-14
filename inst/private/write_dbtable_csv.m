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
## @deftypefn {} {@var{t} =} write_dbtable_csv (@var{filename})
## Private function
## @end deftypefn

function write_dbtable_csv (t, filename)
  fd = fopen(filename, "wt");
  if fd == -1
    error ("Error opening file '%s'", filename);
  endif
  unwind_protect
    cols = subsref (t, substruct(".", "Properties")).VariableNames;
    l = strjoin(cols, ",");
    fprintf(fd, "%s\n", l);

    for idx = 1:length(t)
      row = subsref (t, substruct("{}", {idx,':'}));
      values = "";
      for col=1:numel(cols)
        if col > 1
          values = [values ","];
        endif
        if iscell(row)
          v = row{col}{:};
        else
          v = row(col,:);
        endif
        if islogical(v)
          if v
            v = 1;
          else
            v = 0;
          endif
        endif
        if isnumeric(v)
           v = num2str(v);
        elseif isempty(v)
           v = "";
        endif
        # quote it if spaces
        if !isempty(strchr(v, " "))
          v = ['"' v '"'];
        endif
        values = [values v];
      endfor
      fprintf(fd, "%s\n", char(values));
    endfor

  unwind_protect_cleanup
    fclose(fd);
  end_unwind_protect
endfunction
