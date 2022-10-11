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
## @deftypefn {} {} sqlwrite (@var{db}, @var{tablename}, @var{data})
## @deftypefnx {} {} sqlwrite (@var{db}, @var{tablename}, @var{data}, @var{propertyname}, @var{propertyvalue} @dots{})
## Insert rows of data from @var{tablename}.
##
## If the table does not exist it will be created, using the COlumnType propery if available
## otherwise, the type of input data will be used to determine field types.
##
## @subsubheading Inputs
## @table @asis
## @item @var{db}
## Previously created octave_sqlite object
## @item @var{tablename}
## Name of table to write data to
## @item @var{data}
## Table containing data to write to the database. Variables names are expected to match the databse.
## @item @var{propertyname}, @var{propertyvalue}
##  property name/value pairs where known properties are:
##  @table @asis
##  @item ColumnType
##  Optional cell array of same size as the data that may be used
##  if the table is created as part of the rite operation.
##  @end table
## @end table
##
## @subsubheading Outputs
## None
##
## @seealso{sqlite, execute}
## @end deftypefn

function sqlwrite (db, tablename, data, varargin)
  if nargin < 3 || nargin > 5
    print_usage();
  endif
  if !ischar(tablename)
    error ("Expected tablename as a string");
  endif

  coltypes = {};
  if nargin == 5
    # "ColumnType", value
    if !ischar(varargin{1}) || !strcmp(varargin{1}, "ColumnType")
      error ("Expected optional property as 'ColumnType'");
    endif
    coltypes = varargin{2};  
  elseif nargin == 4
    coltypes = varargin{1};  
  endif

  if isa(data, "struct")
    data = struct2dbtable(data);
  endif
  if !isa(data, "dbtable") && !isa(data, "table")
    error ("Expected input data as a table or struct");
  endif

  # for some reason, the subref using '.' on data isnt working here
  # with errors about our octave_sqlite class not found
  # cols = data.Properties.VariableNames;
  cols = subsref (data, substruct(".", "Properties")).VariableNames;

  if !isempty(coltypes)
    if !iscellstr(coltypes)
      error ("Expected ColumnType to be a cell string");
    endif

    if size(coltypes) != size(cols)
      error ("Expected ColumnType to match data column count size");
    endif
  endif

  sql = sprintf ('INSERT INTO %s (', tablename);
  for col=1:numel(cols)
    if col > 1
      sql = [sql "," ];
    endif
    sql = [sql cols{col}];
  endfor
  sql = [sql ") VALUES \n"];

  for idx = 1:length(data)
    # get each row
    row = subsref (data, substruct("()", {idx,':'}));
    values = "";
    for col=1:numel(cols)
      if col > 1
        values = [values ","];
      endif
      if iscell(row)
        v = row{col};
      else
        v = row(col,:);
      endif
      #if iscell(v)
      #  v = v{1};
      #endif
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
      values = [values v];

    endfor

    if idx > 1
      sql = [sql ",\n"];
    endif
    sql = [sql "(" values ")"];

  endfor

  # create table if ne need to ?
  s = fetch(db, sprintf("SELECT name FROM sqlite_master WHERE type='table' AND name='%s';", tablename));
  if isempty(s)
    # TODO need to create the table
    # if we have ColumnType property in, use it for the types
    values = "";
    for col=1:numel(cols)
      coldata = subsref (data, substruct("()", {':', col}))
      class(coldata)
      iscellstr(coldata)
      class(coldata(1))
    endfor
  endif

  execute(db, sql);

endfunction

%!test
%! testfile = tempname;
%! t = dbtable(['Name1';'Name2'], 'VariableNames', {'Name'});
%! unwind_protect
%!   db = sqlite(testfile, "create");
%!   execute(db, 'CREATE TABLE Test (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT)');
%!   data = sqlread(db, 'Test');
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [0 2]);
%!   sqlwrite(db, "Test", t);
%!   data = sqlread(db, 'Test');
%!   assert(size(data), [2 2]);
%!   close(db);
%!
%! unwind_protect_cleanup
%!   db = 0;
%!   
%!   if exist(testfile, "file")
%!     delete(testfile);
%!   endif
%! end_unwind_protect
