---
layout: "default"
permalink: "/functions/@octave_sqlite/23_octavesqliterollback/"
pkg_name: "sqlite"
pkg_version: "0.0.2"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "Database Operations"
func_name: "@octave_sqlite/rollback"
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
<dt id="index-rollback"><span class="category">: </span><span><em></em> <strong>rollback</strong> <em>(<var>db</var>)</em><a href='#index-rollback' class='copiable-anchor'></a></span></dt>
<dd><p>Rollback changes to a database
</p>
<p>Rollback pending transactions of sqlite connection that has
 AutoCommit = off set.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Create a database table and insert a row, then roll back the insert
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;);
 # create table
 execute(db, 'CREATE TABLE Test (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT)');
 # turn off auto commit
 db.AutoCommit = &quot;off&quot;;
 execute(db, 'INSERT INTO Test (Name) VALUES (&quot;Line1&quot;)');
 # roll back the insert
 rollback(db);
 </code>
 </pre></div>


<p><strong>See also:</strong> sqlite, commit.
 </p></dd></dl>