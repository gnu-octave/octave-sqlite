---
layout: "default"
permalink: "/functions/@octave_sqlite/21_octavesqliteisopen/"
pkg_name: "sqlite"
pkg_version: "0.1.4"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - @octave_sqlite/isopen"
category: "Support Functions"
func_name: "@octave_sqlite/isopen"
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
  subitems:
- id: "14_ImportingData"
  name: "&nbsp;&nbsp;Importing Data"
  url: "/functions/#14_ImportingData"
  subitems:
- id: "14_ExportingData"
  name: "&nbsp;&nbsp;Exporting Data"
  url: "/functions/#14_ExportingData"
  subitems:
- id: "19_DatabaseOperations"
  name: "&nbsp;&nbsp;Database Operations"
  url: "/functions/#19_DatabaseOperations"
  subitems:
- id: "17_SupportFunctions"
  name: "&nbsp;&nbsp;Support Functions"
  url: "/functions/#17_SupportFunctions"
  subitems:
- id: "news"
  name: "News"
  url: "/news"
- id: "manual"
  name: "Manual"
  url: "/manual"
---
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-isopen"><span><code class="def-type"><var class="var">yesno</var> =</code> <strong class="def-name">isopen</strong> <code class="def-code-arguments">(<var class="var">db</var>)</code></span></dt>
<dd><p>Check if a sqlite connection is open
</p>
<p>Return true if the sqlite connection is open, otherwise
 return false.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
<dl class="table">
<dt><var class="var">db</var></dt>
<dd><p>A previously opened sqlite database.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
<dl class="table">
<dt><var class="var">yesno</var></dt>
<dd><p>Boolean for if the database is still open.
 </p></dd>
</dl>


<p><strong class="strong">See also:</strong> sqlite, close.
 </p></dd></dl>