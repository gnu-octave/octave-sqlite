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
## @deftypefn {} {@var{data} =} fetch (@var{db}, @var{sqlquery})
## @deftypefnx {} {@var{data} =} fetch (@var{db}, @var{sqlquery}, @var{propertyname}, @var{propertyvalue} @dots{})
## Return rows of data after running a SQL query on a sqlite database.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
##  currently open sqlite database.
## @item @var{sqlquery}
##  String containing a valid select SQL query.
## @item @var{propertyname}, @var{propertyvalue}
##  property name/value pairs where known properties are:
##  @table @asis
##  @item MaxRows
##   Integer value of max number of rows in the query
##  @item VariableNamingRule
##   String value 'preserve' (default) or 'modify' to flag renaming of variable names (currently ignored)
##  @end table
## @end table
##
## @subsubheading Outputs
## @table @asis
## @item @var{data}
##  a table containing the query result.
## @end table
##
## @seealso{sqlite, sqlread}
## @end deftypefn

function data = fetch (db, query, varargin)
  if nargin < 2
    print_usage();
  endif

  if !ischar(query)
    error ("Expected sqlquery as a string");
  endif

  if numel(varargin) >0
    if mod (numel(varargin), 2) != 0
       error ("expected property name, value pairs");
    endif
    if !iscellstr (varargin (1:2:numel(varargin)))
      error ("expected property names to be strings");
    endif
  endif
 
  for idx=1:2:numel(varargin)
    n = varargin{idx};
    v = varargin{idx+1};
    if strcmp(n, "MaxRows")
      query = [query " LIMIT " num2str(v)];
    elseif strcmp(n, "VariableNamingRule")
      if !ischar(v) || sum(strcmp(v, {'preserve', 'modify'})) != 1
        error ("Expected VariableNamingRule property value to be 'preserve' or 'modify'");
      endif
      # TODO
    else
      error ("Unknown property name '%s'", n);
    endif
  endfor
  
  data = __sqlite_fetch__(db, query);
  data = struct2dbtable(data);
endfunction

%!test
%! testfile = file_in_loadpath("data/bookdb.db");
%! db = sqlite(testfile, "readonly");
%! data = fetch(db, "SELECT * FROM Authors");
%! assert(size(data), [3 4]) 
%! data = fetch(db, "SELECT * FROM Authors", 'MaxRows', 1);
%! assert(size(data), [1 4]) 
%! data = fetch(db, "SELECT AuthorId FROM Authors");
%! assert(size(data), [3 1]) 
%! close (db);
