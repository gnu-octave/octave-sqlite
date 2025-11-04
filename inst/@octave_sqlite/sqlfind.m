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
## @deftypefn {} {@var{data} =} sqlfind (@var{db}, @var{pattern})
## @deftypefnx {} {@var{data} =} sqlfind (@var{db}, @var{pattern}, @var{propertyname}, @var{propertyvalue} @dots{})
## Find information about table types in a database.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
##  currently open sqlite database.
## @item @var{pattern}
##  Name or pattern to match table in database. Use '' to match match all tables.
## @item @var{propertyname}, @var{propertyvalue}
##  property name/value pairs where known properties are:
##  @table @asis
##  @item Catalog
##   catalog value to match
##  @item Schema
##   schema value to match
##  @end table
## @end table
##
## Note: currently the property values are not used in the filter process.
##
## @subsubheading Outputs
## @table @asis
## @item @var{data}
##  a table containing the query result. Table columns are
## 'Catalog', 'Schema', 'Table', 'Columns', 'Type'.
## @end table
##
## @subsubheading Examples
## Show all tables in the database.
## @example
## @code {
## # create sql connection to an existing database
## db = sqlite("mytest.db");
## # list all tables
## data = sqlfind(db, '');
## }
## @end example
##
## Show information about TestTable
## @example
## @code {
## # create sql connection
## db = sqlite("mytest.db");
## # list matching tables
## data = sqlfind(db, 'TestTable');
## }
## @end example
##
## @seealso{sqlite}
## @end deftypefn

function data = sqlfind (db, pattern, varargin)
  if nargin < 2
    print_usage();
  endif

  if !ischar(pattern)
    error ("Expected pattern as a string");
  endif

  if numel(varargin) >0
    if mod (numel(varargin), 2) != 0
       error ("expected property name, value pairs");
    endif
    if !iscellstr (varargin (1:2:numel(varargin)))
      error ("expected property names to be strings");
    endif
  endif

  # TODO: currently ignoring the properties
  
  [~, dbname, ~] = fileparts(db.Database);
 
  query = "select name from sqlite_schema where type = 'table' AND name not like 'sqlite_%'";
  if !isempty(pattern)
    query = [query "AND name like '" pattern "'"];
  endif

  tables = fetch(db, query);

  # TODO: currently getting error when go to access data in table from within the @octave_sqlite folder
  # but not as a struct
  tables = table2struct(tables).name;

  tablename = {};
  catalog = {};
  schema = {};
  type = {};
  columns = {};
 
  for t = 1:length(tables)
    name = tables{t};
    ti = fetch(db,  sprintf("pragma table_info('%s');", name));
    ti = table2struct(ti).name;

    tablename{end+1} = name;
    catalog{end+1} = dbname;
    schema{end+1} = 'dbo';
    type{end+1} = 'table';
  
    cols = {};
    for j=1:length(ti)
      cols(end+1) = ti(j);
    endfor
    columns{end+1} = cols;
  endfor

  data = dbtable(catalog, schema, tablename, columns, type, "VariableNames", {'Catalog', 'Schema', 'Table', 'Columns', 'Type'});

endfunction

%!test
%! testfile = file_in_loadpath("data/bookdb.db");
%! db = sqlite(testfile, "readonly");
%! data = sqlfind(db, "");
%! assert(size(data), [3 5]) 
%!
%! data = sqlfind(db, "Authors");
%! assert(size(data), [1 5]) 
%! assert(data{1,3}{1}, 'Authors')
%! close (db);
