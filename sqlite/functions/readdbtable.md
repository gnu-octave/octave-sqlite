---
layout: "default"
permalink: "/functions/11_readdbtable/"
pkg_name: "sqlite"
pkg_version: "0.1.0"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - readdbtable"
category: "Support Functions"
func_name: "readdbtable"
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
<dl class="first-deftypefn">
<dt class="deftypefn" id="index-readdbtable"><span class="category-def">: </span><span><code class="def-type"><var class="var">t</var> =</code> <strong class="def-name">readdbtable</strong> <code class="def-code-arguments">(<var class="var">filename</var>)</code><a class="copiable-link" href='#index-readdbtable'></a></span></dt>
<dd><p>Create a dbtable from a file
</p>
<p>Currently, this is using a very simplistic approach to read data from a CSV
 formatted file only.
</p> 
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<dl class="table">
<dt><var class="var">filename</var></dt>
<dd><p>Filename for file containing tabular data
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs">Outputs</h4>
<dl class="table">
<dt><var class="var">t</var></dt>
<dd><p>a dbtable of the read data
 </p></dd>
</dl>

</dd></dl>