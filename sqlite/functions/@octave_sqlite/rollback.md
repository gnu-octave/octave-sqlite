---
layout: "default"
permalink: "/functions/@octave_sqlite/23_octavesqliterollback/"
pkg_name: "sqlite"
pkg_version: "0.1.0"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - @octave_sqlite/rollback"
category: "Database Operations"
func_name: "@octave_sqlite/rollback"
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
<dt class="deftypefn" id="index-rollback"><span class="category-def">: </span><span><strong class="def-name">rollback</strong> <code class="def-code-arguments">(<var class="var">db</var>)</code><a class="copiable-link" href='#index-rollback'></a></span></dt>
<dd><p>Rollback changes to a database
</p>
<p>Rollback pending transactions of sqlite connection that has
 AutoCommit = off set.
</p>
<h4 class="subsubheading" id="Inputs">Inputs</h4>
<dl class="table">
<dt><var class="var">db</var></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs">Outputs</h4>
<p>None
</p>
<h4 class="subsubheading" id="Examples">Examples</h4>
<p>Create a database table and insert a row, then roll back the insert
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
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


<p><strong class="strong">See also:</strong> sqlite, commit.
 </p></dd></dl>