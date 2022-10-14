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
## @deftypefn {} {@var{t} =} read_dbtable_csv (@var{filename})
## Private function
## @end deftypefn

function t = read_dbtable_csv (filename)
  coldata = {};
  colnames = {};

  fd = fopen(filename, "rt");
  unwind_protect
    l = fgetl(fd);
    colnames = strsplit(l, ",");

    ncols = size(colnames, 2);
    coldata = cell(1, ncols);
    while !feof(fd)
      l = fgetl(fd);
      if !isempty(l)
        s = split_line(l, ",");
        for idx=1:ncols
          if idx <= size(s,2)
            coldata{idx}{end+1} = s{idx};
          else
            coldata{idx}{end+1} = [];
          endif
        endfor
      endif
    endwhile
  unwind_protect_cleanup
    fclose(fd);
  end_unwind_protect

  t = dbtable(coldata{:}, 'VariableNames', colnames);
endfunction

function sp = split_line(s, sep=",")
  sp = {};
  # split line at sep, BUT handle potential '"' etc. at start of string
  st = "";
  instring = false;
  firstchar = true;
  allowtrim = true;
  for idx=1:length(s)
    c = s(idx);

    if !instring
      if c == sep
        sp{end+1} = st;
        st = [];
        firstchar = true;
        allowtrim = true;
      elseif c == '"' && isempty(st)
        instring = true;
        allowtrim = false;
      else
        if allowtrim && (c == ' ' || c=='\t')
         # dont keep it
        else
          if !isempty(st)
            st = [st c];
          else
            st = c;
          endif
        endif
      endif
    else
      # in a string
      if c == '"'
        instring = false;
      else
        if !isempty(st)
          st = [st c];
        else
          st = c;
        endif
      endif
    endif
  endfor

  if !isempty(st)
    sp{end+1} = st;
  endif
  
endfunction
