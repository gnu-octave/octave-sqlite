---
layout: "default"
permalink: "/functions/@octave_sqlite/23_octavesqlitesqlwrite/"
pkg_name: "sqlite"
pkg_version: "0.0.1"
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
<dt id="index-sqlwrite"><span class="category">: </span><span><em></em> <strong>sqlwrite</strong> <em>(<var>db</var>, <var>tablename</var>, <var>data</var>)</em><a href='#index-sqlwrite' class='copiable-anchor'> &para;</a></span></dt>
<dt id="index-sqlwrite-1"><span class="category">: </span><span><em></em> <strong>sqlwrite</strong> <em>(<var>db</var>, <var>tablename</var>, <var>data</var>, <var>propertyname</var>, <var>propertyvalue</var> &hellip;)</em><a href='#index-sqlwrite-1' class='copiable-anchor'> &para;</a></span></dt>
<dd><p>Insert rows of data from <var>tablename</var>.
</p>
<p>If the table does not exist it will be created, using the COlumnType propery if available
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
<dd><p>Table containing data to write to the database. Variables names are expected to match the databse.
 </p></dd>
<dt><span><var>propertyname</var>, <var>propertyvalue</var></span></dt>
<dd><p>property name/value pairs where known properties are:
  </p><dl compact="compact">
<dt><span>ColumnType</span></dt>
<dd><p>Optional cell array of same size as the data that may be used
  if the table is created as part of the rite operation.
  </p></dd>
</dl>
</dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>

<p><strong>See also:</strong> sqlite, execute.
 </p></dd></dl>