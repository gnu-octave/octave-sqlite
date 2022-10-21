---
layout: "default"
permalink: "/functions/7_dbtable/"
pkg_name: "sqlite"
pkg_version: "0.0.2"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "Support Functions"
func_name: "dbtable"
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
<dt id="index-dbtable_0028_0029"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable()</strong><a href='#index-dbtable_0028_0029' class='copiable-anchor'></a></span></dt>
<dt id="index-dbtable"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable</strong> <em>(<var>var1</var>, &hellip; <var>varn</var>)</em><a href='#index-dbtable' class='copiable-anchor'></a></span></dt>
<dt id="index-dbtable-1"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable</strong> <em>(&hellip; <var>propertyname</var>, <var>propertyvalue</var>)</em><a href='#index-dbtable-1' class='copiable-anchor'></a></span></dt>
<dd><p>Create a table of data
</p>
<p>dbtable is a basic implementation of a table type to avoid dependencies on other packages.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>var1</var> &hellip; <var>varn</var></span></dt>
<dd><p>Variables or data to be used as the column data of the table. When the input is a variable,
 the variable name will be used as the column name, otherwise the columns will be Var1 &hellip;
 VarN.
 </p></dd>
<dt><span><var>propertyname</var>, <var>propertyvalue</var></span></dt>
<dd><p>Property name/value pairs, where known property names are:
  </p><dl compact="compact">
<dt><span>VariableNames</span></dt>
<dd><p>A cell string matching the number of input columns with the name to use for the
  </p></dd>
<dt><span>DimensionNames</span></dt>
<dd><p>A cell string matching of length 2 for using as dimension access. If not specified
  it will be &quot;Rows&quot; and &quot;Variables&quot;.
  </p></dd>
</dl>
</dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>table</var></span></dt>
<dd><p>a dbtable object
 </p></dd>
</dl>

<span id="Object-Properties"></span><h4 class="subsubheading">Object Properties</h4>
<p>A dbtable object has the following properties:
 </p><dl compact="compact">
<dt><span>Properties</span></dt>
<dd><p>A table properties struct.
</p>
<p>The table struct includes fields:
  </p><dl compact="compact">
<dt><span>Description</span></dt>
<dd><p>Text table description
  </p></dd>
<dt><span>DimensionNames</span></dt>
<dd><p>Cell array of Row and Variable dimension names
  </p></dd>
<dt><span>VariableNames</span></dt>
<dd><p>Cell array of variable (column) names
  </p></dd>
<dt><span>UserData</span></dt>
<dd><p>User data value
  </p></dd>
</dl>
</dd>
</dl>

<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Directly create a 2 column table from input of each column
 </p><div class="example">
<pre class="example"> <code>
 t = dbtable([0;1;3], [2;4;6]);
 </code>
 </pre></div>

<p>Directly create a 2 column table from input of each column, and specify variable 
 names
 </p><div class="example">
<pre class="example"> <code>
 t = dbtable([0;1;3], [2;4;6], &quot;VariableNames&quot;, {'Variable1', 'Variable2'});
 </code>
 </pre></div>

<p>Create a 2 column table from 2 variables V1, V2
 </p><div class="example">
<pre class="example"> <code>
 V1 = [0;1;3];
 V2 = [2;4;6];
 t = dbtable(V1, V2);
 </code>
 </pre></div>


<p><strong>See also:</strong> readdbtable, struct2dbtable.
 </p></dd></dl>