---
layout: "default"
permalink: "/functions/6_sqlite/"
pkg_name: "sqlite"
pkg_version: "0.0.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit"
category: "SQLITE connection"
func_name: "sqlite"
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
<dt id="index-sqlite"><span class="category">: </span><span><em><var>db</var> =</em> <strong>sqlite</strong> <em>(<var>filename</var>)</em><a href='#index-sqlite' class='copiable-anchor'></a></span></dt>
<dt id="index-sqlite-1"><span class="category">: </span><span><em><var>db</var> =</em> <strong>sqlite</strong> <em>(<var>filename</var>, <var>mode</var>)</em><a href='#index-sqlite-1' class='copiable-anchor'></a></span></dt>
<dd><p>Create a sqlite database connection
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><code><var>filename</var></code></span></dt>
<dd><p>Filename of the sqlite database
 </p></dd>
<dt><span><code><var>mode</var></code></span></dt>
<dd><p>mode for the sqlite access &rsquo;readonly&rsquo;, &rsquo;connect&rsquo; (default), &rsquo;create&rsquo;.
 </p></dd>
</dl>

<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><code><var>db</var></code></span></dt>
<dd><p>a opened SQLITE database as a octave_sqlite object
 </p></dd>
</dl>

<span id="Object-Properties"></span><h4 class="subsubheading">Object Properties</h4>
<p>The octave_sqlite object has the following properties:
</p>
<dl compact="compact">
<dt><span>Database</span></dt>
<dd><p>The name of the opened database file (readonly)
 </p></dd>
<dt><span>IsOpen</span></dt>
<dd><p>Boolean field for if the database is currently open (readonly)
 </p></dd>
<dt><span>IsReadOnly</span></dt>
<dd><p>Boolean field for if the database was opened in readonly mode. (readonly)
 </p></dd>
<dt><span>AutoCommit</span></dt>
<dd><p>String flag field for whether database is in auto commit mode. &quot;on&quot; (default) or &quot;off&quot;.
 </p></dd>
</dl>

<span id="Examples"></span><h4 class="subsubheading">Examples</h4>
<p>Open a sqlite database, failing if it doesnt exist.
 </p><div class="example">
<pre class="example"> <code>
 db = sqlite(&quot;mytest.db&quot;);
 </code>
 </pre></div>

<p>Open a sqlite database, creating it if it does not exist.
 </p><div class="example">
<pre class="example"> <code>
 db = sqlite(&quot;mytest.db&quot;, &quot;create&quot;);
 </code>
 </pre></div>

</dd></dl>