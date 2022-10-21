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
## @deftypefn {} {@var{data} =} sqlread (@var{db}, @var{tablename})
## @deftypefnx {} {@var{data} =} sqlread (@var{db}, @var{tablename}, @var{propertyname}, @var{propertyvalue} @dots{})
## Return rows of data from table @var{tablename} in a sqlite database.
##
## This function is the equivalent of running SELECT * FROM @var{table}.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
##  currently open sqlite database.
## @item @var{tablename}
##  Name of a table with the database.
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
## @subsubheading Examples
## Select all rows of data from a database table
## @example
## @code {
## # create sql connection
## db = sqlite("mytest.db");
## data = sqlread(db, 'TestTable');
## }
## @end example
##
## Select 5 rows of data from a database table
## @example
## @code {
## # create sql connection
## db = sqlite("mytest.db");
## data = sqlread(db, 'TestTable', "MaxRows", 5);
## }
## @end example
##
## @seealso{sqlite, fetch}
## @end deftypefn

function data = sqlread (db, tablename, varargin)
  if nargin < 2
    print_usage();
  endif

  if !ischar(tablename)
    error ("Expected tablename as a string");
  endif

  if numel(varargin) >0
    if mod (numel(varargin), 2) != 0
       error ("expected property name, value pairs");
    endif
    if !iscellstr (varargin (1:2:numel(varargin)))
      error ("expected property names to be strings");
    endif
  endif
 
  query = ["SELECT * FROM " tablename];

  data = fetch(db, query, varargin{:});
endfunction

%!test
%! testfile = file_in_loadpath("data/bookdb.db");
%! db = sqlite(testfile, "readonly");
%! data = sqlread(db, "Authors");
%! assert(size(data), [3 4]) 
%! data = sqlread(db, "Authors", 'MaxRows', 1);
%! assert(size(data), [1 4]) 
%! close (db);
