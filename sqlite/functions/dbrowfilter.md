---
layout: "default"
permalink: "/functions/11_dbrowfilter/"
pkg_name: "sqlite"
pkg_version: "0.1.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - dbrowfilter"
category: "Support Functions"
func_name: "dbrowfilter"
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
<dt class="deftypefn def-line" id="index-dbrowfilter_0028C_0029"><span class="category-def">: </span><span><code class="def-type"><var class="var">rowfilt</var> =</code> <strong class="def-name">dbrowfilter(<var class="var">C</var>)</strong><a class="copiable-link" href="#index-dbrowfilter_0028C_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dbrowfilter_0028T_0029"><span class="category-def">: </span><span><code class="def-type"><var class="var">rowfilt</var> =</code> <strong class="def-name">dbrowfilter(<var class="var">T</var>)</strong><a class="copiable-link" href="#index-dbrowfilter_0028T_0029"></a></span></dt>
<dd><p>Create an unconstrained dbrowfilter object with columns names.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<dl class="table">
<dt><var class="var">C</var></dt>
<dd><p>A column name, cell array of column names.
 </p></dd>
<dt><var class="var">T</var></dt>
<dd><p>A table to use for column names.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<dl class="table">
<dt><var class="var">rowfilt</var></dt>
<dd><p>a dbrowfilter object
 </p></dd>
</dl>

<h4 class="subsubheading" id="Object-Properties"><span>Object Properties<a class="copiable-link" href="#Object-Properties"></a></span></h4>
<p>Object properties are the names of the columns on creation of the filter.
</p>
<p>Constraints can be set on a specific field of the filter by setting a
 comparison value for the variable name.
</p>
<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<div class="example">
<pre class="example-preformatted"> <code class="code">
 # create a dbrowfilter with 2 columns
 rf = dbrowfilter({'Column1', 'Column2'});
 # add a constraint for Column1 &gt; 10
 rfc = rf.Column1 &gt; 10
 </code>
 </pre></div>


<p><strong class="strong">See also:</strong> dbtable.
 </p></dd></dl>