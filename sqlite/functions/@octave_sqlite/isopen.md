---
layout: "default"
permalink: "/functions/@octave_sqlite/21_octavesqliteisopen/"
pkg_name: "sqlite"
pkg_version: "0.0.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "SQLITE connection"
func_name: "@octave_sqlite/isopen"
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
<dt id="index-isopen"><span class="category">: </span><span><em><var>yesno</var> =</em> <strong>isopen</strong> <em>(<var>db</var>)</em><a href='#index-isopen' class='copiable-anchor'></a></span></dt>
<dd><p>Return true if the sqlite connection is open.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>previously opened sqlite database.
 </p></dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>yesno</var></span></dt>
<dd><p>Boolean for if the database is still open.
 </p></dd>
</dl>


<p><strong>See also:</strong> sqlite, close.
 </p></dd></dl>