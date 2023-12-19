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
## @deftypefn {} {} sqlupdate (@var{db}, @var{tablename}, @var{data}, @var{filter})
## @deftypefnx {} {} sqlupdate (@var{db}, @var{tablename}, @var{data}, @var{filter}, @var{propertyname}, @var{propertyvalue} @dots{})
## Update rows of data into a table.
##
## Update rows of data into a sqlite database table based on the input filter.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
## Previously created octave_sqlite object
## @item @var{tablename}
## Name of table to write data to
## @item @var{data}
## Table containing data to write to the database. Variables names are expected to match the database.
## @item @var{filter}
## A Filter object  or cell array of filter objects used to determine which rows of the table to update.
## @item @var{propertyname}, @var{propertyvalue}
##  property name/value pairs where known properties are:
##  @table @asis
##  @item Catalog
##  An optional database catalog name.
##  @item Schema
##  An optional database schema name.
##  @end table
## @end table
##
## @subsubheading Outputs
## None
##
## @subsubheading Examples
## Create a database table and insert a row
## @example
## @code {
## # create sql connection
## db = sqlite("mytest.db", "create");
## # create table (if it does not exist) and then insert 2 rows
## t = dbtable([1;2],['Name1';'Name2'], 'VariableNames', @{'Id','Name'@});
## # insert table data
## sqlwrite(db, "Test", t, 'ColumnType', @{'numeric', 'text'@});
## # make a filter to select what to update
## rf = dbrowfilter(@{'Id'@});
## rf = rf.Id > 1;
## # update name where Id > 1
## t = dbtable(['Name3'], 'VariableNames', @{'Name'@});
## sqlupdate(db, "Test", t, rf);
## }
## @end example
##
## @seealso{sqlite, execute}
## @end deftypefn

function sqlupdate (db, tablename, data, filter, varargin)
  if nargin < 4
    print_usage();
  endif

  if mod (nargin, 2) != 0
   error ("sqlupdate: expected property name, value pairs");
  endif
  if !iscellstr (varargin (1:2:nargin-4))
    error ("sqlupdate: expected property names to be strings");
  endif
 
  if !ischar(tablename)
    error ("Expected tablename as a string");
  endif

  if isa(data, "struct")
    data = struct2dbtable(data);
  endif
  if isa(data, "table")
    data = table2struct(data);
    data = struct2dbtable(data);
  endif
  if !isa(data, "dbtable") && !isa(data, "table")
    error ("Expected input data as a table or struct");
  endif

  for i = 1:2:nargin-4
    propname = tolower (varargin{i});
    propvalue = varargin{i+1};

    # currently not using the properties, but verify name at least
    if strcmp(propname, "schema") == false &&  strcmp(propname, "catalog") == false
      error ("sqlupdate: Unknown property name '%s'", propname);
    endif
  endfor

  # for some reason, the subref using '.' on data isnt working here
  # with errors about our octave_sqlite class not found
  # cols = data.Properties.VariableNames;
  cols = subsref (data, substruct(".", "Properties")).VariableNames;
  row = subsref (data, substruct("{}", {1,':'}));

  sql = sprintf("UPDATE %s SET ", tablename);
  for col=1:numel(cols)
    if col > 1
      sql = [sql "," ];
    endif
    if iscell(row)
      v = row{col};
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
      else
         v = ['"' v '"'];
      endif
 
    sql = [sql cols{col} " = " v];
  endfor

  sql = [sql " WHERE " char(filter)];
 
  execute(db, sql);

endfunction

%!test
%! testfile = tempname;
%! t = dbtable([1;2],['Name1';'Name2'], 'VariableNames', {'Id','Name'});
%! unwind_protect
%!   db = sqlite(testfile, "create");
%!   sqlwrite(db, "Test", t);
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [2 2]);
%!   assert(data{:,:}, {{1; 2}, {'Name1'; 'Name2'}}), 
%!   t = dbtable(['Name3'], 'VariableNames', {'Name'});
%!   rf = dbrowfilter("Id");
%!   rf = (rf.Id == 1);
%!   sqlupdate(db, "Test", t, rf);
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [2 2]);
%!   assert(data{:,:}, {{1; 2}, {'Name3'; 'Name2'}}), 
%!   close(db);
%!
%! unwind_protect_cleanup
%!   db = 0;
%!   
%!   if exist(testfile, "file")
%!     delete(testfile);
%!   endif
%! end_unwind_protect
