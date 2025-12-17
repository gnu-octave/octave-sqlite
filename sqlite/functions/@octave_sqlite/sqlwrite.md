---
layout: "default"
permalink: "/functions/@octave_sqlite/23_octavesqlitesqlwrite/"
pkg_name: "sqlite"
pkg_version: "0.1.2"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - @octave_sqlite/sqlwrite"
category: "Exporting Data"
func_name: "@octave_sqlite/sqlwrite"
navigation:
- id: "overview"
  name: "Overview"
  url: "/index"
- id: "Functions"
  name: "Function Reference"
  url: "/functions"
- id: "17_SQLITEconnection"
  name: "&nbsp;&nbsp;SQLITE connection"
  url: "/functions/#17_SQLITEconnection"
- id: "14_ImportingData"
  name: "&nbsp;&nbsp;Importing Data"
  url: "/functions/#14_ImportingData"
- id: "14_ExportingData"
  name: "&nbsp;&nbsp;Exporting Data"
  url: "/functions/#14_ExportingData"
- id: "19_DatabaseOperations"
  name: "&nbsp;&nbsp;Database Operations"
  url: "/functions/#19_DatabaseOperations"
- id: "17_SupportFunctions"
  name: "&nbsp;&nbsp;Support Functions"
  url: "/functions/#17_SupportFunctions"
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sqlwrite"><span class="category-def">: </span><span><strong class="def-name">sqlwrite</strong> <code class="def-code-arguments">(<var class="var">db</var>, <var class="var">tablename</var>, <var class="var">data</var>)</code><a class="copiable-link" href="#index-sqlwrite"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sqlwrite-1"><span class="category-def">: </span><span><strong class="def-name">sqlwrite</strong> <code class="def-code-arguments">(<var class="var">db</var>, <var class="var">tablename</var>, <var class="var">data</var>, <var class="var">columntypes</var>)</code><a class="copiable-link" href="#index-sqlwrite-1"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sqlwrite-2"><span class="category-def">: </span><span><strong class="def-name">sqlwrite</strong> <code class="def-code-arguments">(<var class="var">db</var>, <var class="var">tablename</var>, <var class="var">data</var>, <var class="var">propertyname</var>, <var class="var">propertyvalue</var> &hellip;)</code><a class="copiable-link" href="#index-sqlwrite-2"></a></span></dt>
<dd><p>Insert rows of data into a table.
</p>
<p>Insert rows of data into a sqlite database table.
 If the table does not exist it will be created, using the ColumnType property if available
 otherwise, the type of input data will be used to determine field types.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<dl class="table">
<dt><var class="var">db</var></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
<dt><var class="var">tablename</var></dt>
<dd><p>Name of table to write data to
 </p></dd>
<dt><var class="var">data</var></dt>
<dd><p>Table containing data to write to the database. Variables names are expected to match the database.
 </p></dd>
<dt><var class="var">columntypes</var></dt>
<dd><p>Optional cell array of same size as data used if table must be created. The column types may also
 be passed in using the <var class="var">propertyname</var>, <var class="var">propertyvalue</var> syntax.
 </p></dd>
<dt><var class="var">propertyname</var>, <var class="var">propertyvalue</var></dt>
<dd><p>property name/value pairs where known properties are:
  </p><dl class="table">
<dt>ColumnType</dt>
<dd><p>Optional cell array of same size as the data that may be used
  if the table is created as part of the write operation.
  </p></dd>
</dl>
</dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<p>None
</p>
<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Create a database table and insert a row
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;, &quot;create&quot;);
 # create table (if it does not exist) and then insert 2 rows
 t = dbtable([1;2],['Name1';'Name2'], 'VariableNames', {'Id','Name'});
 # insert table data
 sqlwrite(db, &quot;Test&quot;, t, 'ColumnType', {'numeric', 'text'});
 </code>
 </pre></div>


<p><strong class="strong">See also:</strong> sqlite, execute.
 </p></dd></dl>