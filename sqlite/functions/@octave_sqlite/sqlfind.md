---
layout: "default"
permalink: "/functions/@octave_sqlite/22_octavesqlitesqlfind/"
pkg_name: "sqlite"
pkg_version: "0.1.1"
pkg_description: "Basic Octave implementation of sqlite toolkit"
title: "Sqlite Toolkit - @octave_sqlite/sqlfind"
category: "SQLITE connection"
func_name: "@octave_sqlite/sqlfind"
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
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-sqlfind"><span class="category-def">: </span><span><code class="def-type"><var class="var">data</var> =</code> <strong class="def-name">sqlfind</strong> <code class="def-code-arguments">(<var class="var">db</var>, <var class="var">pattern</var>)</code><a class="copiable-link" href="#index-sqlfind"></a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-sqlfind-1"><span class="category-def">: </span><span><code class="def-type"><var class="var">data</var> =</code> <strong class="def-name">sqlfind</strong> <code class="def-code-arguments">(<var class="var">db</var>, <var class="var">pattern</var>, <var class="var">propertyname</var>, <var class="var">propertyvalue</var> &hellip;)</code><a class="copiable-link" href="#index-sqlfind-1"></a></span></dt>
<dd><p>Find information about table types in a database.
</p>
<h4 class="subsubheading" id="Inputs"><span>Inputs<a class="copiable-link" href="#Inputs"></a></span></h4>
<dl class="table">
<dt><var class="var">db</var></dt>
<dd><p>currently open sqlite database.
 </p></dd>
<dt><var class="var">pattern</var></dt>
<dd><p>Name or pattern to match table in database. Use &rdquo; to match match all tables.
 </p></dd>
<dt><var class="var">propertyname</var>, <var class="var">propertyvalue</var></dt>
<dd><p>property name/value pairs where known properties are:
  </p><dl class="table">
<dt>Catalog</dt>
<dd><p>catalog value to match
  </p></dd>
<dt>Schema</dt>
<dd><p>schema value to match
  </p></dd>
</dl>
</dd>
</dl>

<p>Note: currently the property values are not used in the filter process.
</p>
<h4 class="subsubheading" id="Outputs"><span>Outputs<a class="copiable-link" href="#Outputs"></a></span></h4>
<dl class="table">
<dt><var class="var">data</var></dt>
<dd><p>a table containing the query result. Table columns are
 &rsquo;Catalog&rsquo;, &rsquo;Schema&rsquo;, &rsquo;Table&rsquo;, &rsquo;Columns&rsquo;, &rsquo;Type&rsquo;.
 </p></dd>
</dl>

<h4 class="subsubheading" id="Examples"><span>Examples<a class="copiable-link" href="#Examples"></a></span></h4>
<p>Show all tables in the database.
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 # create sql connection to an existing database
 db = sqlite(&quot;mytest.db&quot;);
 # list all tables
 data = sqlfind(db, '');
 </code>
 </pre></div>

<p>Show information about TestTable
 </p><div class="example">
<pre class="example-preformatted"> <code class="code">
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;);
 # list matching tables
 data = sqlfind(db, 'TestTable');
 </code>
 </pre></div>


<p><strong class="strong">See also:</strong> sqlite.
 </p></dd></dl>