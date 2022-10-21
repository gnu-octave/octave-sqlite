---
layout: "default"
permalink: "/functions/14_struct2dbtable/"
pkg_name: "sqlite"
pkg_version: "0.0.2"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "Support Functions"
func_name: "struct2dbtable"
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
<dt id="index-struct2dbtable"><span class="category">: </span><span><em><var>t</var> =</em> <strong>struct2dbtable</strong> <em>(<var>astruct</var>)</em><a href='#index-struct2dbtable' class='copiable-anchor'></a></span></dt>
<dd><p>Create a dbtable from a struct
</p> 
<p>This function uses the field names and data of the fields to create a table
 representation of the struct.
</p>
<p>Each fieldname will be a variable in the table. The data for each variable
 will be the data of the fieldname, and is expected to be a uniform size for
 all fields in the struct.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>astruct</var></span></dt>
<dd><p>A struct with same number of elements in each field
 </p></dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>t</var></span></dt>
<dd><p>a dbtable of the <var>astruct</var> data
 </p></dd>
</dl>

</dd></dl>