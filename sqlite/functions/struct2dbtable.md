---
layout: "default"
permalink: "/functions/14_struct2dbtable/"
pkg_name: "sqlite"
pkg_version: "0.1.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - struct2dbtable"
category: "Support Functions"
func_name: "struct2dbtable"
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
<dt class="deftypefn def-line" id="index-struct2dbtable"><span class="category-def">: </span><span><code class="def-type"><var class="var">t</var> =</code> <strong class="def-name">struct2dbtable</strong> <code class="def-code-arguments">(<var class="var">astruct</var>)</code><a class="copiable-link" href="#index-struct2dbtable"></a></span></dt>
<dd><p>Create a dbtable from a struct
</p> 
<p>This function uses the field names and data of the fields to create a table
 representation of the struct.
</p>
<p>Each fieldname will be a variable in the table. The data for each variable
 will be the data of the fieldname, and is expected to be a uniform size for
 all fields in the struct.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<dl class="table">
<dt><var class="var">astruct</var></dt>
<dd><p>A struct with same number of elements in each field
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<dl class="table">
<dt><var class="var">t</var></dt>
<dd><p>a dbtable of the <var class="var">astruct</var> data
 </p></dd>
</dl>

</dd></dl>