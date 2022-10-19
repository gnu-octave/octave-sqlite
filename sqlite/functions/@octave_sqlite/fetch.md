---
layout: "default"
permalink: "functions/20_octavesqlitefetch/"
pkg_name: "sqlite"
pkg_version: "0.0.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "Importing Data"
func_name: "@octave_sqlite/fetch"
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
<dt id="index-fetch"><span class="category">: </span><span><em><var>data</var> =</em> <strong>fetch</strong> <em>(<var>db</var>, <var>sqlquery</var>)</em><a href='#index-fetch' class='copiable-anchor'> &para;</a></span></dt>
<dt id="index-fetch-1"><span class="category">: </span><span><em><var>data</var> =</em> <strong>fetch</strong> <em>(<var>db</var>, <var>sqlquery</var>, <var>propertyname</var>, <var>propertyvalue</var> &hellip;)</em><a href='#index-fetch-1' class='copiable-anchor'> &para;</a></span></dt>
<dd><p>Return rows of data after runnning a sql query on a sqlite database.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>currently open sqlite database.
 </p></dd>
<dt><span><var>sqlquery</var></span></dt>
<dd><p>String containing a valid select sqlquery.
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


<p><strong>See also:</strong> sqlite, sqlread.
 </p></dd></dl>