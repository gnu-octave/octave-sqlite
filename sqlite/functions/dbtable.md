---
layout: "default"
permalink: "functions/7_dbtable/"
pkg_name: "sqlite"
pkg_version: "0.0.1"
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
<dt id="index-dbtable_0028_0029"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable()</strong><a href='#index-dbtable_0028_0029' class='copiable-anchor'> &para;</a></span></dt>
<dt id="index-dbtable"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable</strong> <em>(<var>var1</var>, &hellip; <var>varn</var>)</em><a href='#index-dbtable' class='copiable-anchor'> &para;</a></span></dt>
<dt id="index-dbtable-1"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable</strong> <em>(&hellip; <var>propertyname</var>, <var>propertyvalue</var>)</em><a href='#index-dbtable-1' class='copiable-anchor'> &para;</a></span></dt>
<dd><p>Basic implementation of a table type to avoid dependancies on other packages.
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
<dd><p>a cell string matching the number of input columns with the name to use for the
  </p></dd>
<dt><span>DimensionNames</span></dt>
<dd><p>a cell string matching of length 2 for using as dimesion access. If not specified
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
</dd></dl>