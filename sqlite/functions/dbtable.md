---
layout: "default"
permalink: "/functions/7_dbtable/"
pkg_name: "sqlite"
pkg_version: "0.1.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - dbtable"
category: "Support Functions"
func_name: "dbtable"
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
<dt class="deftypefn def-line" id="index-dbtable_0028_0029"><span class="category-def">: </span><span><code class="def-type"><var class="var">table</var> =</code> <strong class="def-name">dbtable()</strong><a class="copiable-link" href="#index-dbtable_0028_0029"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dbtable"><span class="category-def">: </span><span><code class="def-type"><var class="var">table</var> =</code> <strong class="def-name">dbtable</strong> <code class="def-code-arguments">(<var class="var">var1</var>, &hellip; <var class="var">varn</var>)</code><a class="copiable-link" href="#index-dbtable"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-dbtable-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">table</var> =</code> <strong class="def-name">dbtable</strong> <code class="def-code-arguments">(&hellip; <var class="var">propertyname</var>, <var class="var">propertyvalue</var>)</code><a class="copiable-link" href="#index-dbtable-1"></a></span></dt>
<dd><p>Create a table of data
</p>
<p>dbtable is a basic implementation of a table type to avoid dependencies on other packages.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<dl class="table">
<dt><var class="var">var1</var> &hellip; <var class="var">varn</var></dt>
<dd><p>Variables or data to be used as the column data of the table. When the input is a variable,
 the variable name will be used as the column name, otherwise the columns will be Var1 &hellip;
 VarN.
 </p></dd>
<dt><var class="var">propertyname</var>, <var class="var">propertyvalue</var></dt>
<dd><p>Property name/value pairs, where known property names are:
  </p><dl class="table">
<dt>VariableNames</dt>
<dd><p>A cell string matching the number of input columns with the name to use for the
  </p></dd>
<dt>DimensionNames</dt>
<dd><p>A cell string matching of length 2 for using as dimension access. If not specified
  it will be &quot;Rows&quot; and &quot;Variables&quot;.
  </p></dd>
</dl>
</dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<dl class="table">
<dt><var class="var">table</var></dt>
<dd><p>a dbtable object
 </p></dd>
</dl>

<h4 class="subsubheading" id="Object-Properties"><span>Object Properties<a class="copiable-link" href="#Object-Properties"></a></span></h4>
<p>A dbtable object has the following properties:
 </p><dl class="table">
<dt>Properties</dt>
<dd><p>A table properties struct.
</p>
<p>The table struct includes fields:
  </p><dl class="table">
<dt>Description</dt>
<dd><p>Text table description
  </p></dd>
<dt>DimensionNames</dt>
<dd><p>Cell array of Row and Variable dimension names
  </p></dd>
<dt>VariableNames</dt>
<dd><p>Cell array of variable (column) names
  </p></dd>
<dt>UserData</dt>
<dd><p>User data value
  </p></dd>
</dl>
</dd>
</dl>

<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Directly create a 2 column table from input of each column
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 t = dbtable([0;1;3], [2;4;6]);
 </code>
 </pre></div>

<p>Directly create a 2 column table from input of each column, and specify variable 
 names
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 t = dbtable([0;1;3], [2;4;6], &quot;VariableNames&quot;, {'Variable1', 'Variable2'});
 </code>
 </pre></div>

<p>Create a 2 column table from 2 variables V1, V2
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 V1 = [0;1;3];
 V2 = [2;4;6];
 t = dbtable(V1, V2);
 </code>
 </pre></div>


<p><strong class="strong">See also:</strong> readdbtable, struct2dbtable.
 </p></dd></dl>