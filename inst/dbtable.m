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

classdef dbtable
  ## -*- texinfo -*- 
  ## @deftypefn {} {@var{table} =} dbtable()
  ## @deftypefnx {} {@var{table} =} dbtable (@var{var1}, @dots{} @var{varn})
  ## @deftypefnx {} {@var{table} =} dbtable (@dots{} @var{propertyname}, @var{propertyvalue})
  ## Basic implementation of a table type to avoid dependencies on other packages.
  ##
  ## @subsubheading Inputs
  ## @table @asis
  ## @item @var{var1} @dots{} @var{varn} 
  ## Variables or data to be used as the column data of the table. When the input is a variable,
  ## the variable name will be used as the column name, otherwise the columns will be Var1 @dots{}
  ## VarN.
  ## @item @var{propertyname}, @var{propertyvalue}
  ## Property name/value pairs, where known property names are:
  ##  @table @asis
  ##  @item VariableNames
  ##  A cell string matching the number of input columns with the name to use for the
  ##  @item DimensionNames
  ##  A cell string matching of length 2 for using as dimension access. If not specified
  ##  it will be "Rows" and "Variables".
  ##  @end table
  ## @end table
  ##
  ## @subsubheading Outputs
  ## @table @asis
  ## @item @var{table}
  ## a dbtable object
  ## @end table
  ##
  ## @subsubheading Object Properties
  ## A dbtable object has the following properties:
  ## @table @asis
  ## @item Properties
  ## A table properties struct.
  ##
  ##  The table struct includes fields:
  ##  @table @asis
  ##  @item Description
  ##  Text table description
  ##  @item DimensionNames
  ##  Cell array of Row and Variable dimension names
  ##  @item VariableNames
  ##  Cell array of variable (column) names
  ##  @item UserData
  ##  User data value
  ##  @end table
  ## @end table
  ## @end deftypefn

  properties (Access = private)
    # internal data store
    _data = {};
  endproperties

  properties (Access = public)

    Properties = struct ( ...
      'Description', "", ...
      'DimensionNames', {{'Row' 'Variables'}}, ...
      'VariableNames', {{}}, ...
      'VariableDescriptions', {{}}, ...
      'VariableUnits', {{}}, ...
      'RowNames', {{}}, ...
      'UserData', [] ...
    );
  endproperties

  methods (Access = private)
    function idx = getcolidx(this, colname)
      idx = find(strcmp(this.Properties.VariableNames, colname));
      if isempty(idx)
        idx = -1;
      endif
    endfunction

    function [type, nulls] = datatype(this, in)
      type = "unknown";
      nulls = false;
      if iscell(in)
        is_numeric = 0;
        is_string = 0;
        is_null = 0;
        for idx=1:numel(in)
          if !isnumeric(in{idx})
            if ischar(in{idx})
              is_string++;
            elseif isempty(in{idx})
              is_null++;
            endif
          else
            if isempty(in{idx})
              is_null++;
            else
              is_numeric++;
            endif
          endif
        endfor

        if is_numeric && !is_string
          type = "numeric";
        elseif is_string && !is_numeric
          type = "string";
        endif
        nulls = is_null > 0;
      else
        if isnumeric(in)
          type = "numeric";
        else ischar(in)
          type = "string";
        endif
      endif
    endfunction

    function data = fromcell(this, in)
      if iscell(in)
        [type nulls] = this.datatype(in);
        if strcmp(type, "numeric")
          data = cell2mat(in);
        else
          data = in;
        endif
      else
        type = 'notcell';
        data = in;
      endif
    endfunction

    function y = isinputproperty(this, n)
      y = false;
      if ischar(n)
        if sum(strcmp(n, {"VariableNames", "RowNames", "DimensionNames", "Size"})) > 0
          y = true;
        endif
      endif
    endfunction
  endmethods

  methods (Access = public)
    function this = dbtable (varargin)

      # work out where properties start
      prop_idx = -1;
      for idx = 1:length(varargin)
        if this.isinputproperty(varargin{idx})
          prop_idx = idx;
          break;
        endif
      endfor

      if prop_idx > 0
        if mod (nargin-prop_idx+1, 2) != 0
          error ("expected property name, value pairs");
        endif
        if !iscellstr (varargin (prop_idx:2:nargin))
          error ("expected property names to be strings");
        endif
      endif
      
      if nargin == 1
        # special handling for copy constructor
	if isa (varargin{1}, "dbtable")
          this._data = varargin{1}._data;
          this.Properties = varargin{1}.Properties;
          return;
        endif
      endif

      # if here, we expect to have column data and optional properties as at leats first col isnt properties
      if prop_idx != 1
        data2 = {};

        if prop_idx < 1
          prop_idx = nargin+1;
        endif

        for idx=1:prop_idx-1

          if isstruct(varargin{idx})
            error ("dbtable doesnt support columns of structs");
          endif

          n = inputname(idx);
          if isempty(n)
            n = sprintf("Var%d", idx);
          endif

          v = varargin{idx};
          if iscell(v) 
            v = v(:);
          endif

          data2{end+1} = v;
          this.Properties.VariableNames{end+1} = n;
        endfor

        this._data = data2;
      endif

      # some properties to deal with
      if prop_idx < nargin && prop_idx > 0
        for idx=prop_idx:2:nargin
          n = varargin{idx};
          v = varargin{idx+1};

          if strcmp(n, "VariableNames")
            if !iscellstr(v) || size(v, 2) != size(this, 2)
              error ("Expected VariableNames to be a cell string, with size matching table columns"); 
            endif
            this.Properties.VariableNames = v;
          elseif strcmp(n, "RowNames")
            this.Properties.RowNames = v;
          elseif strcmp(n, "DimensionNames")
            if !iscellstr(v) || size(v, 2) != 2
              error ("Expected DimensionNames to be a cell string, with size of 2"); 
            endif
            this.Properties.DimensionNames = v;
          else
            error ("Unknown property '%s'", n);
          endif
        endfor
      endif

      # verify col data all same length
      sz = size(this._data, 2);
      if sz > 0
        len1 = size(this._data{1}, 1);
        for idx=2:sz
          len2 = size(this._data{idx}, 1);
          if len2 != len1
            error ("Row data is different length in column %d", idx); 
          endif
        endfor
      endif

    endfunction

    function disp (this)
      sz = size(this);
      printf ("  %dx%d table\n\n", sz(1), sz(2));

      if sz != [0 0]
        show_all = true;
        if sz(1) > 20
          show_all = false;
          sz(1) = 20;
        endif

        widths = zeros(1, sz(2));

        for col = 1:sz(2)
          n = this.Properties.VariableNames{col};
          widths(col) = length(n);
          #data = this._data.(n);
          data = this._data{col};
          for row = 1:sz(1)
            
            d = data(row,:);
            if iscell(d)
              d = d{1};
            endif
            if !isnumeric(d)
             d = num2str(d);
            endif
            w = length(d);
            if w > widths(col)
              widths(col) = w;
            endif

          endfor

        endfor

        for col = 1:sz(2)
          printf("  ");
          t = sprintf("%%-%d.%ds", widths(col), widths(col));
          printf(t, this.Properties.VariableNames{col});
        endfor
        printf("\n");
        for col = 1:sz(2)
          printf("  ");
          printf("%s", repmat("_", 1, widths(col)));
        endfor
        printf("\n\n");

        for row = 1:sz(1)
          for col = 1:sz(2)
            printf("  ");
            data = this._data{col};
  
            d = data(row,:);
            if iscell(d)
              d = d{1};
            endif
            if !ischar(d)
             d = num2str(d);
            endif
 
            t = sprintf("%%-%d.%ds", widths(col), widths(col));
            printf(t, d);
          endfor
          printf("\n");
        endfor

        if !show_all
          printf("  <table truncated>");
        endif

     endif

    endfunction

    function val = subsref (this, s)
      if isempty(s)
        error ("dbtable.subsref missing index");
      endif
      if s(1).type == "."
	n = s(1).subs;
	if strcmp(n, "Properties")
	  val = this.(n);
        elseif !isempty(this.Properties.DimensionNames) && strcmp(this.Properties.DimensionNames{1}, n)
          # return all row names
          if !isempty(this.Properties.RowNames)
            val = this.Properties.RowNames
          else
            sz = size(this, 1);
            val = cell(sz, 1);
          endif
        elseif !isempty(this.Properties.DimensionNames) && strcmp(this.Properties.DimensionNames{2}, n)
          # return all row data
          subs = substruct('{}',{':'});
          val = subsref(this, subs);
	elseif this.getcolidx(n) != -1
          # check in variable names
	  idx = this.getcolidx(n);
	  val = this._data{idx};

          if (numel (s) > 1) && (s(2).type =="()" || s(2).type == "{}")
            if size(s(2).subs, 1) == 1
              s(2).subs = {s(2).subs{1} ':'};
            endif
          endif
        else
          error("'%s' unknown property name", n);
	endif
      elseif s(1).type == "{}"
        if numel(s(1).subs) == 1
          s(1).subs = {s(1).subs{:}, ':'};
        endif
        row = s(1).subs{1};
        col = s(1).subs{2};
        cval = this._data(col);
        val = {};
        for idx=1:numel(cval)
          val{end+1} = cval{idx}(row,:);
        endfor
        # if returning single row, just return row instead if cell array
        if size(val) == [1 1]
          val = val{1};
        endif
      elseif s(1).type == "()"
        if numel(s(1).subs) == 1
          s(1).subs = {s(1).subs{:}, ':'};
        endif
        row = s(1).subs{1};
        col = s(1).subs{2};
        names = this.Properties.VariableNames(col);
        cval = this._data(col);
        val = {};
        for idx=1:numel(cval)
          val{end+1} = cval{idx}(row,:);
        endfor

        val = dbtable(val{:}, 'VariableNames', names');
      else
        error("unimplemented dbtable.subsref type");
      endif

      if (numel (s) > 1)
        val = subsref (val, s(2:end));
      endif
    endfunction

    function summary (this)
      printf("Properties:\n");
        printf("  %s: %s\n", "Description", this.Properties.Description);
      printf("Variables:\n");
      for idx = 1:length(this.Properties.VariableNames)
        n = this.Properties.VariableNames{idx};
        var = this._data{idx};
        printf("  %s %dx%d %s\n", n, size(var,1), size(var,2), class(var));
        # Properties
        #  Description
        #  Units
        # Values
        #   Min, Median Max
      endfor
    endfunction

    # rows, columns just calls size
    function varargout = size(this, dimn=1)
      sz0 = 0;
      sz1 = length(this._data);
      if sz1 > 0
       sz0 = size(this._data{1}, 1);
      endif

      if nargin == 1
        s = [sz0 sz1];
      elseif dimn == 1
        s = sz0;
      elseif dimn == 2
        s = sz1;
      else
        error ("dimn should be 1 or 2");
      endif

      if size(s,2) == 2 && nargout > 1
        varargout{1} = s(1);
        varargout{2} = s(2);
      else
        varargout{1} = s;
      endif
    endfunction

    function s = length(this)
      s = size(this, 1);
    endfunction

    function e = isempty(this)
      e = (length(this) == 0);
    endfunction

    function y = istable(this)
      y = true;
    endfunction

    function y = ismatrix(this)
      y = true;
    endfunction

    function st = table2struct(this)
      names = this.Properties.VariableNames;
      st = {};
      for idx=1:numel(names)
        st.(names{idx}) = this._data{idx};
      endfor
    endfunction

    function writetable (this, filename)
      [~, ~, ext] = fileparts(filename);
      if isempty(ext)
        ext = ".csv"
      endif

      switch tolower(ext)
        case { ".txt" ".csv" ".dat" }
          write_dbtable_csv(this, filename);
        otherwise
          error ("unknown or unsupported format for '%s'", ext); 
      endswitch
    endfunction

    # head tail - create sub tables
    function tdata = head(this, rows)
      nrows = size(this, 1);
      if rows > nrows
        rows = nrows;
      endif
      names = this.Properties.VariableNames;
      data = this.subsref(substruct('{}', {1:rows, ':'}));
      tdata = dbtable(data{:}, 'VariableNames', names);
    endfunction

    function tdata = tail(this, rows)
      nrows = size(this, 1);
      if rows >= nrows
        rows = 1;
      else
        rows = nrows - rows + 1;
      endif
      names = this.Properties.VariableNames;
      data = this.subsref(substruct('{}', {rows:nrows, ':'}));
      tdata = dbtable(data{:}, 'VariableNames', names);
    endfunction
  endmethods

%{
  # octave ignores hiddent currently
  methods (Hidden = true)
    function tdata = _RawData(this)
      tdata = this._data;
    endfunction
  endmethods
%}
endclassdef

%!test
%! t = dbtable();
%! assert(size(t), [0 0]);
%! assert(length(t), 0);
%! assert(rows(t), 0);
%! assert(columns(t), 0);
%! assert(isempty(t));

%!test
%! t = dbtable([0;1;3], [2;4;6]);
%! assert(size(t), [3 2]);
%! assert(length(t), 3);
%! assert(rows(t), 3);
%! assert(columns(t), 2);
%! assert(!isempty(t));
%! assert(t.Properties.VariableNames, {'Var1', 'Var2'});
%! assert(t.Var1, [0;1;3]);
%! assert(t.Var2, [2;4;6]);
%! assert(t.Variables, {[0;1;3], [2;4;6]});
%! assert(t{:,:}, {[0;1;3], [2;4;6]});
%! assert(t{1,:}, {[0], [2]});
%! assert(t{1,1}, [0]);
%! assert(t{1,2}, [2]);
%!
%! t.Properties.Description = "Test data";
%!
%! t.Properties.VariableNames = {'V1', 'V2'};
%! assert(t.V1, [0;1;3]);
%! assert(t.V2, [2;4;6]);

%!test
%! t = dbtable([0;1;3], [2;4;6]);
%! assert(istable(t));
%! t1 = t(:,:);
%! assert(istable(t1));
%! assert(size(t1), [3 2])
%! assert(t1{:,:}, {[0;1;3], [2;4;6]});
%!
%! t1 = t(:,1);
%! assert(istable(t1));
%! assert(size(t1), [3 1])
%! assert(t1{:,:}, [0;1;3]);
%!
%! t1 = t(:,2);
%! assert(istable(t1));
%! assert(size(t1), [3 1])
%! assert(t1{:,:}, [2;4;6]);
%!
%! t1 = t(1,:);
%! assert(istable(t1));
%! assert(size(t1), [1 2])
%! assert(t1{:,:}, {[0], [2]});

%!test
%! t = dbtable([0;1;3], [2;4;6]);
%! assert(size(t), [3 2]);
%! tc = dbtable(t);
%! assert(size(tc), [3 2]);

%!test
%! V1 = [0;1;3];
%! V2 = [2;4;6];
%! t = dbtable(V1, V2);
%! assert(size(t), [3 2]);
%! assert(length(t), 3);
%! assert(rows(t), 3);
%! assert(columns(t), 2);
%! assert(!isempty(t));
%! assert(t.Properties.VariableNames, {'V1', 'V2'});
%! assert(t.V1, V1);
%! assert(t.V2, V2);

%!test
%! V1 = [0;1;3];
%! V2 = [2;4;6];
%! t = dbtable(V1, V2);
%! s = table2struct(t);
%! assert(fieldnames(s), {'V1'; 'V2'});
%! assert(s.V1, [0;1;3]);
