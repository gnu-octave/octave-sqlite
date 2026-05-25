---
layout: "default"
permalink: "/functions/6_sqlite/"
pkg_name: "sqlite"
pkg_version: "0.1.4"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - sqlite"
category: "Support Functions"
func_name: "sqlite"
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
<dt class="deftypefn def-line" id="index-sqlite"><span><code class="def-type"><var class="var">db</var> =</code> <strong class="def-name">sqlite</strong> <code class="def-code-arguments">(<var class="var">filename</var>)</code></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sqlite-1"><span><code class="def-type"><var class="var">db</var> =</code> <strong class="def-name">sqlite</strong> <code class="def-code-arguments">(<var class="var">filename</var>, <var class="var">mode</var>)</code></span></dt>
<dd><p>Create a sqlite database connection
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs</span></h4>
<dl class="table">
<dt><code class="code"><var class="var">filename</var></code></dt>
<dd><p>Filename of the sqlite database
 </p></dd>
<dt><code class="code"><var class="var">mode</var></code></dt>
<dd><p>mode for the sqlite access &rsquo;readonly&rsquo;, &rsquo;connect&rsquo; (default), &rsquo;create&rsquo;.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Outputs"><span>Outputs</span></h4>
<dl class="table">
<dt><code class="code"><var class="var">db</var></code></dt>
<dd><p>a opened SQLITE database as a octave_sqlite object
 </p></dd>
</dl>

<h4 class="subsubheading" id="Object-Properties"><span>Object Properties</span></h4>
<p>The octave_sqlite object has the following properties:
</p>
<dl class="table">
<dt>Database</dt>
<dd><p>The name of the opened database file (readonly)
 </p></dd>
<dt>IsOpen</dt>
<dd><p>Boolean field for if the database is currently open (readonly)
 </p></dd>
<dt>IsReadOnly</dt>
<dd><p>Boolean field for if the database was opened in readonly mode. (readonly)
 </p></dd>
<dt>AutoCommit</dt>
<dd><p>String flag field for whether database is in auto commit mode. &quot;on&quot; (default) or &quot;off&quot;.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Examples"><span>Examples</span></h4>
<p>Open a sqlite database, failing if it does not exist.
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 db = sqlite(&quot;mytest.db&quot;);
 </code>
 </pre></div>

<p>Open a sqlite database, creating it if it does not exist.
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 db = sqlite(&quot;mytest.db&quot;, &quot;create&quot;);
 </code>
 </pre></div>

</dd></dl>