---
layout: "default"
permalink: "/functions/11_readdbtable/"
pkg_name: "sqlite"
pkg_version: "0.0.2"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "Support Functions"
func_name: "readdbtable"
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
<dt id="index-readdbtable"><span class="category">: </span><span><em><var>t</var> =</em> <strong>readdbtable</strong> <em>(<var>filename</var>)</em><a href='#index-readdbtable' class='copiable-anchor'></a></span></dt>
<dd><p>Create a dbtable from a file
</p>
<p>Currently, this is using a very simplistic approach to read data from a CSV
 formatted file only.
</p> 
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>filename</var></span></dt>
<dd><p>Filename for file containing tabular data
 </p></dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>t</var></span></dt>
<dd><p>a dbtable of the read data
 </p></dd>
</dl>

</dd></dl>