---
layout: "default"
permalink: "./sqlite/functions/@octave_sqlite/22_octavesqliteexecute"
pkg_name: "sqlite"
pkg_version: "0.0.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "Database Operations"
func_name: "@octave_sqlite/execute"
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
<dt id="index-execute"><span class="category">: </span><span><em></em> <strong>execute</strong> <em>(<var>db</var>, <var>sqlquery</var>)</em><a href='#index-execute' class='copiable-anchor'> &para;</a></span></dt>
<dd><p>Execute non select sql query <var>sqlquery</var> on a sqlite database.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
<dt><span><var>sqlquery</var></span></dt>
<dd><p>A valid non selecting SQL query string
 </p></dd>
</dl>

<span id="Inputs-1"></span><h4 class="subsubheading">Inputs</h4>
<p>None
</p>

<p><strong>See also:</strong> sqlite, fetch.
 </p></dd></dl>