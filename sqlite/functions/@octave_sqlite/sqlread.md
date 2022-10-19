---
layout: "default"
permalink: "./sqlite/functions/@octave_sqlite/22_octavesqlitesqlread"
pkg_name: "sqlite"
pkg_version: "0.0.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "Importing Data"
func_name: "@octave_sqlite/sqlread"
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
<dt id="index-sqlread"><span class="category">: </span><span><em><var>data</var> =</em> <strong>sqlread</strong> <em>(<var>db</var>, <var>tablename</var>)</em><a href='#index-sqlread' class='copiable-anchor'> &para;</a></span></dt>
<dt id="index-sqlread-1"><span class="category">: </span><span><em><var>data</var> =</em> <strong>sqlread</strong> <em>(<var>db</var>, <var>tablename</var>, <var>propertyname</var>, <var>propertyvalue</var> &hellip;)</em><a href='#index-sqlread-1' class='copiable-anchor'> &para;</a></span></dt>
<dd><p>Return rows of data from table <var>tablename</var> in a sqlite database.
</p>
<p>This function is the equivalent of running SELECT * FROM <var>table</var>.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>currently open sqlite database.
 </p></dd>
<dt><span><var>tablename</var></span></dt>
<dd><p>Name of a table with the database.
 </p></dd>
<dt><span><var>propertyname</var>, <var>propertyvalue</var></span></dt>
<dd><p>property name/value pairs where known properties are:
  </p><dl compact="compact">
<dt><span>MaxRows</span></dt>
<dd><p>Integer value of max number of rows in the query
  </p></dd>
<dt><span>VariableNamingRule</span></dt>
<dd><p>String value &rsquo;preserve&rsquo; (default) or &rsquo;modify&rsquo; to flag renaming of variable names (currently ignored)
  </p></dd>
</dl>
</dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>data</var></span></dt>
<dd><p>a table containing the query result.
 </p></dd>
</dl>


<p><strong>See also:</strong> sqlite, fetch.
 </p></dd></dl>