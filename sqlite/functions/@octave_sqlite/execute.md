---
layout: "default"
permalink: "/functions/@octave_sqlite/22_octavesqliteexecute/"
pkg_name: "sqlite"
pkg_version: "0.0.3"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - @octave_sqlite/execute"
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
<dt id="index-execute"><span class="category">: </span><span><em></em> <strong>execute</strong> <em>(<var>db</var>, <var>sqlquery</var>)</em><a href='#index-execute' class='copiable-anchor'></a></span></dt>
<dd><p>Execute a SQL statement on a sqlite database
</p>
<p>Execute non select SQL query <var>sqlquery</var> on a sqlite database.
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
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Create a database table and insert a row
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;, &quot;create&quot;);
 # create table and then insert a row
 execute(db, 'CREATE TABLE Test (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT)');
 execute(db, 'INSERT INTO Test (Name) VALUES (&quot;Line1&quot;)');
 </code>
 </pre></div>


<p><strong>See also:</strong> sqlite, fetch.
 </p></dd></dl>