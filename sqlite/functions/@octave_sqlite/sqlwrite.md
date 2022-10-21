---
layout: "default"
permalink: "/functions/@octave_sqlite/23_octavesqlitesqlwrite/"
pkg_name: "sqlite"
pkg_version: "0.0.2"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "Exporting Data"
func_name: "@octave_sqlite/sqlwrite"
navigation:
- id: "overview"
  name: "Overview"
  url: "/index"
- id: "Functions"
  name: "Function Reference"
  url: "/functions"
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="def">
<dt id="index-sqlwrite"><span class="category">: </span><span><em></em> <strong>sqlwrite</strong> <em>(<var>db</var>, <var>tablename</var>, <var>data</var>)</em><a href='#index-sqlwrite' class='copiable-anchor'></a></span></dt>
<dt id="index-sqlwrite-1"><span class="category">: </span><span><em></em> <strong>sqlwrite</strong> <em>(<var>db</var>, <var>tablename</var>, <var>data</var>, <var>columntypes</var>)</em><a href='#index-sqlwrite-1' class='copiable-anchor'></a></span></dt>
<dt id="index-sqlwrite-2"><span class="category">: </span><span><em></em> <strong>sqlwrite</strong> <em>(<var>db</var>, <var>tablename</var>, <var>data</var>, <var>propertyname</var>, <var>propertyvalue</var> &hellip;)</em><a href='#index-sqlwrite-2' class='copiable-anchor'></a></span></dt>
<dd><p>Insert rows of data into a table.
</p>
<p>Insert rows of data into a sqlite database table.
 If the table does not exist it will be created, using the ColumnType property if available
 otherwise, the type of input data will be used to determine field types.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
<dt><span><var>tablename</var></span></dt>
<dd><p>Name of table to write data to
 </p></dd>
<dt><span><var>data</var></span></dt>
<dd><p>Table containing data to write to the database. Variables names are expected to match the database.
 </p></dd>
<dt><span><var>columntypes</var></span></dt>
<dd><p>Optional cell array of same size as data used if table must be created. The column types may also
 be passed in using the <var>propertyname</var>, <var>propertyvalue</var> syntax.
 </p></dd>
<dt><span><var>propertyname</var>, <var>propertyvalue</var></span></dt>
<dd><p>property name/value pairs where known properties are:
  </p><dl compact="compact">
<dt><span>ColumnType</span></dt>
<dd><p>Optional cell array of same size as the data that may be used
  if the table is created as part of the write operation.
  </p></dd>
</dl>
</dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Create a database table and insert a row
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;, &quot;create&quot;);
 # create table (if it does not exist) and then insert 2 rows
 t = dbtable([1;2],['Name1';'Name2'], 'VariableNames', {'Id','Name'});
 # insert table data
 sqlwrite(db, &quot;Test&quot;, t, 'ColumnType', {'numeric', 'text'});
 </code>
 </pre></div>


<p><strong>See also:</strong> sqlite, execute.
 </p></dd></dl>