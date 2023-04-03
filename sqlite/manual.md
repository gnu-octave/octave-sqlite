---
layout: "default"
permalink: "/manual/"
title: "Sqlite Toolkit - Manual"
pkg_name: "sqlite"
version: "0.0.3"
description: "Basic Octave implementation of sqlite toolkit"
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
- id: "Installing-and-loading-1"
  name: "&nbsp;&nbsp; Installing and loading"
  url: "/manual/#Installing-and-loading-1"
- id: "Basic-Usage-Overview-1"
  name: "&nbsp;&nbsp; Basic Usage Overview"
  url: "/manual/#Basic-Usage-Overview-1"
- id: "Function-Reference-1"
  name: "&nbsp;&nbsp; Function Reference"
  url: "/manual/#Function-Reference-1"
---
<h1 class="settitle" align="center">Octave SQLITE - Basic implementation of SQLITE Toolkit for GNU Octave</h1>
<div class="top" id="Top">
<div class="header">
<p>
Next: <a href="#Installing-and-loading" accesskey="n" rel="next">Installing and loading</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Introduction"></span><h1 class="top">Introduction</h1>
<p>The Octave SQLITE toolkit is a set of SQLITE routines for GNU Octave
</p>
<div class="Contents_element" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>
<div class="contents">
<ul class="no-bullet">
  <li><a id="toc-Installing-and-loading-1" href="#Installing-and-loading">1 Installing and loading</a>
  <ul class="no-bullet">
    <li><a id="toc-Online-Direct-install" href="#Online-Direct-install">1.1 Online Direct install</a></li>
    <li><a id="toc-Off_002dline-install" href="#Off_002dline-install">1.2 Off-line install</a></li>
    <li><a id="toc-Loading" href="#Loading">1.3 Loading</a></li>
  </ul></li>
  <li><a id="toc-Basic-Usage-Overview-1" href="#Basic-Usage-Overview">2 Basic Usage Overview</a>
  <ul class="no-bullet">
    <li><a id="toc-Connection-to-a-sqlite-database" href="#Connection-to-a-sqlite-database">2.1 Connection to a sqlite database</a></li>
    <li><a id="toc-Read-a-table" href="#Read-a-table">2.2 Read a table</a></li>
    <li><a id="toc-Close-the-database" href="#Close-the-database">2.3 Close the database</a></li>
  </ul></li>
  <li><a id="toc-Function-Reference-1" href="#Function-Reference">3 Function Reference</a>
  <ul class="no-bullet">
    <li><a id="toc-SQLITE-connection-1" href="#SQLITE-connection">3.1 SQLITE connection</a>
    <ul class="no-bullet">
      <li><a id="toc-_0040octave_005fsqlite_002fclose" href="#g_t_0040octave_005fsqlite_002fclose">3.1.1 @octave_sqlite/close</a></li>
      <li><a id="toc-_0040octave_005fsqlite_002fisopen" href="#g_t_0040octave_005fsqlite_002fisopen">3.1.2 @octave_sqlite/isopen</a></li>
      <li><a id="toc-sqlite" href="#sqlite">3.1.3 sqlite</a></li>
    </ul></li>
    <li><a id="toc-Importing-Data-1" href="#Importing-Data">3.2 Importing Data</a>
    <ul class="no-bullet">
      <li><a id="toc-_0040octave_005fsqlite_002ffetch" href="#g_t_0040octave_005fsqlite_002ffetch">3.2.1 @octave_sqlite/fetch</a></li>
      <li><a id="toc-_0040octave_005fsqlite_002fsqlread" href="#g_t_0040octave_005fsqlite_002fsqlread">3.2.2 @octave_sqlite/sqlread</a></li>
    </ul></li>
    <li><a id="toc-Exporting-Data-1" href="#Exporting-Data">3.3 Exporting Data</a>
    <ul class="no-bullet">
      <li><a id="toc-_0040octave_005fsqlite_002fsqlwrite" href="#g_t_0040octave_005fsqlite_002fsqlwrite">3.3.1 @octave_sqlite/sqlwrite</a></li>
    </ul></li>
    <li><a id="toc-Database-Operations-1" href="#Database-Operations">3.4 Database Operations</a>
    <ul class="no-bullet">
      <li><a id="toc-_0040octave_005fsqlite_002fcommit" href="#g_t_0040octave_005fsqlite_002fcommit">3.4.1 @octave_sqlite/commit</a></li>
      <li><a id="toc-_0040octave_005fsqlite_002fexecute" href="#g_t_0040octave_005fsqlite_002fexecute">3.4.2 @octave_sqlite/execute</a></li>
      <li><a id="toc-_0040octave_005fsqlite_002frollback" href="#g_t_0040octave_005fsqlite_002frollback">3.4.3 @octave_sqlite/rollback</a></li>
    </ul></li>
    <li><a id="toc-Support-Functions-1" href="#Support-Functions">3.5 Support Functions</a>
    <ul class="no-bullet">
      <li><a id="toc-dbtable" href="#dbtable">3.5.1 dbtable</a></li>
      <li><a id="toc-readdbtable" href="#readdbtable">3.5.2 readdbtable</a></li>
      <li><a id="toc-struct2dbtable" href="#struct2dbtable">3.5.3 struct2dbtable</a></li>
    </ul></li>
  </ul></li>
  <li><a id="toc-GNU-General-Public-License" href="#Copying">Appendix A GNU General Public License</a></li>
  <li><a id="toc-Index-1" href="#Index" rel="index">Index</a></li>
</ul>
</div>
</div>
<hr>
<div class="chapter" id="Installing-and-loading">
<div class="header">
<p>
Next: <a href="#Basic-Usage-Overview" accesskey="n" rel="next">Basic Usage Overview</a>, Previous: <a href="#Top" accesskey="p" rel="prev">Introduction</a>, Up: <a href="#Top" accesskey="u" rel="up">Introduction</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Installing-and-loading-1"></span><h2 class="chapter">1 Installing and loading</h2>
<span id="index-Installing-and-loading"></span>
<p>The toolkit must be installed and then loaded to be used.
</p>
<p>It can be installed in <acronym>GNU</acronym> Octave directly from the website,
or can be installed in an off-line mode via a downloaded tarball.
</p>
<p>The toolkit has a dependency on the SQLITE library (<a href="https://www.sqlite.org/">https://www.sqlite.org/</a>), so it must be installed in order
to successfully install the toolkit.
</p>
<p>The toolkit must be then be loaded once per each <acronym>GNU</acronym> Octave session in order to use its functionality.
</p>
<ul class="section-toc">
<li><a href="#Online-Direct-install" accesskey="1">Online Direct install</a></li>
<li><a href="#Off_002dline-install" accesskey="2">Off-line install</a></li>
<li><a href="#Loading" accesskey="3">Loading</a></li>
</ul>
<div class="section" id="Online-Direct-install">
<h3 class="section">1.1 Online Direct install</h3>
<span id="index-Online-install"></span>
<p>With an internet connection available, the octave sqlite package can be installed from
the octave-sqlite website using the following command within <acronym>GNU</acronym> Octave:
</p>
<div class="example">
<pre class="example">pkg install https://github.com/gnu-octave/octave-sqlite/releases/download/v0.0.3/octave-sqlite-0.0.3.tar.gz
</pre></div>
<p>On Octave 7.2 and later, the package can be installed using the following command within
<acronym>GNU</acronym> Octave:
</p>
<div class="example">
<pre class="example">pkg install -forge sqlite
</pre></div>
<p>The latest released version of the toolkit will be downloaded and installed.
</p>
</div>
<div class="section" id="Off_002dline-install">
<h3 class="section">1.2 Off-line install</h3>
<span id="index-Off_002dline-install"></span>
<p>With the toolkit package already downloaded, and in the current directory when running
<acronym>GNU</acronym> Octave, the package can be installed using the following command within <acronym>GNU</acronym> Octave:
</p>
<div class="example">
<pre class="example">pkg install octave-sqlite-0.0.3.tar.gz
</pre></div>
</div>
<div class="section" id="Loading">
<h3 class="section">1.3 Loading</h3>
<span id="index-Loading"></span>
<p>Regardless of the method of installing the toolkit, in order to use its functions,
the toolkit must be loaded using the pkg load command:
</p>
<div class="example">
<pre class="example">pkg load sqlite
</pre></div>
<p>The toolkit must be loaded on each <acronym>GNU</acronym> Octave session.
</p>
<hr>
</div>
</div>
<div class="chapter" id="Basic-Usage-Overview">
<div class="header">
<p>
Next: <a href="#Function-Reference" accesskey="n" rel="next">Function Reference</a>, Previous: <a href="#Installing-and-loading" accesskey="p" rel="prev">Installing and loading</a>, Up: <a href="#Top" accesskey="u" rel="up">Introduction</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Basic-Usage-Overview-1"></span><h2 class="chapter">2 Basic Usage Overview</h2>
<span id="index-Basic-Usage-Overview"></span>
<ul class="section-toc">
<li><a href="#Connection-to-a-sqlite-database" accesskey="1">Connection to a sqlite database</a></li>
<li><a href="#Read-a-table" accesskey="2">Read a table</a></li>
<li><a href="#Close-the-database" accesskey="3">Close the database</a></li>
</ul>
<div class="section" id="Connection-to-a-sqlite-database">
<h3 class="section">2.1 Connection to a sqlite database</h3>
<span id="index-Connection-to-a-sqlite-database"></span>
<p>Connection to the database is done using the sqlite function.
</p>
<span id="Example"></span><h4 class="subsubheading">Example</h4>
<div class="example">
<pre class="example"><code>
db = sqlite('testdb.db')
</code>
<kbd>
db =
 sqlite with properties
      Database: testdb.db
    IsReadOnly: 0
    AutoCommit: on
</kbd>
</pre></div>
</div>
<div class="section" id="Read-a-table">
<h3 class="section">2.2 Read a table</h3>
<span id="index-Read-a-table"></span>
<p>To quickly read data from a table, use the sqlread function
</p>
<span id="Example-1"></span><h4 class="subsubheading">Example</h4>
<div class="example">
<pre class="example"><code>
data = sqlread(db, &quot;TestTable&quot;)
</code>
</pre></div>
</div>
<div class="section" id="Close-the-database">
<h3 class="section">2.3 Close the database</h3>
<span id="index-Close-the-database"></span>
<p>To close the database, use the close function
</p>
<span id="Example-2"></span><h4 class="subsubheading">Example</h4>
<div class="example">
<pre class="example"><code>
close(db)
</code>
</pre></div>
<hr>
</div>
</div>
<div class="chapter" id="Function-Reference">
<div class="header">
<p>
Next: <a href="#Copying" accesskey="n" rel="next">GNU General Public License</a>, Previous: <a href="#Basic-Usage-Overview" accesskey="p" rel="prev">Basic Usage Overview</a>, Up: <a href="#Top" accesskey="u" rel="up">Introduction</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Function-Reference-1"></span><h2 class="chapter">3 Function Reference</h2>
<span id="index-Function-Reference"></span>
<p>The functions currently available in the toolkit are described below;
</p>
<ul class="section-toc">
<li><a href="#SQLITE-connection" accesskey="1">SQLITE connection</a></li>
<li><a href="#Importing-Data" accesskey="2">Importing Data</a></li>
<li><a href="#Exporting-Data" accesskey="3">Exporting Data</a></li>
<li><a href="#Database-Operations" accesskey="4">Database Operations</a></li>
<li><a href="#Support-Functions" accesskey="5">Support Functions</a></li>
</ul>
<hr>
<div class="section" id="SQLITE-connection">
<div class="header">
<p>
Next: <a href="#Importing-Data" accesskey="n" rel="next">Importing Data</a>, Up: <a href="#Function-Reference" accesskey="u" rel="up">Function Reference</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="SQLITE-connection-1"></span><h3 class="section">3.1 SQLITE connection</h3>
<span id="index-SQLITE-connection"></span>
<ul class="section-toc">
<li><a href="#g_t_0040octave_005fsqlite_002fclose" accesskey="1">@octave_sqlite/close</a></li>
<li><a href="#g_t_0040octave_005fsqlite_002fisopen" accesskey="2">@octave_sqlite/isopen</a></li>
<li><a href="#sqlite" accesskey="3">sqlite</a></li>
</ul>
<div class="subsection" id="g_t_0040octave_005fsqlite_002fclose">
<h4 class="subsection">3.1.1 @octave_sqlite/close</h4>
<span id="index-close"></span>
<dl class="def">
<dt id="index-close-1"><span class="category">: </span><span><em></em> <strong>close</strong> <em>(<var>db</var>)</em><a href='#index-close-1' class='copiable-anchor'></a></span></dt>
<dd><p>Close a sqlite connection
</p>
<p>Close the previously opened sqlite connection <var>db</var>.
</p>
<span id="Inputs"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>A previously created octave_sqlite object
 </p></dd>
</dl>
<span id="Outputs"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<p><strong>See also:</strong> sqlite, isopen.
 </p></dd></dl>
</div>
<div class="subsection" id="g_t_0040octave_005fsqlite_002fisopen">
<h4 class="subsection">3.1.2 @octave_sqlite/isopen</h4>
<span id="index-isopen"></span>
<dl class="def">
<dt id="index-isopen-1"><span class="category">: </span><span><em><var>yesno</var> =</em> <strong>isopen</strong> <em>(<var>db</var>)</em><a href='#index-isopen-1' class='copiable-anchor'></a></span></dt>
<dd><p>Check if a sqlite connection is open
</p>
<p>Return true if the sqlite connection is open, otherwise
 return false.
</p>
<span id="Inputs-1"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>A previously opened sqlite database.
 </p></dd>
</dl>
<span id="Outputs-1"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>yesno</var></span></dt>
<dd><p>Boolean for if the database is still open.
 </p></dd>
</dl>
<p><strong>See also:</strong> sqlite, close.
 </p></dd></dl>
</div>
<div class="subsection" id="sqlite">
<h4 class="subsection">3.1.3 sqlite</h4>
<span id="index-sqlite"></span>
<dl class="def">
<dt id="index-sqlite-1"><span class="category">: </span><span><em><var>db</var> =</em> <strong>sqlite</strong> <em>(<var>filename</var>)</em><a href='#index-sqlite-1' class='copiable-anchor'></a></span></dt>
<dt id="index-sqlite-2"><span class="category">: </span><span><em><var>db</var> =</em> <strong>sqlite</strong> <em>(<var>filename</var>, <var>mode</var>)</em><a href='#index-sqlite-2' class='copiable-anchor'></a></span></dt>
<dd><p>Create a sqlite database connection
</p>
<span id="Inputs-2"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><code><var>filename</var></code></span></dt>
<dd><p>Filename of the sqlite database
 </p></dd>
<dt><span><code><var>mode</var></code></span></dt>
<dd><p>mode for the sqlite access &rsquo;readonly&rsquo;, &rsquo;connect&rsquo; (default), &rsquo;create&rsquo;.
 </p></dd>
</dl>
<span id="Outputs-2"></span><h4 class="subsubheading">Outputs</h4>
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
<p>Open a sqlite database, failing if it does not exist.
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
<hr>
</div>
</div>
<div class="section" id="Importing-Data">
<div class="header">
<p>
Next: <a href="#Exporting-Data" accesskey="n" rel="next">Exporting Data</a>, Previous: <a href="#SQLITE-connection" accesskey="p" rel="prev">SQLITE connection</a>, Up: <a href="#Function-Reference" accesskey="u" rel="up">Function Reference</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Importing-Data-1"></span><h3 class="section">3.2 Importing Data</h3>
<span id="index-Importing-Data"></span>
<ul class="section-toc">
<li><a href="#g_t_0040octave_005fsqlite_002ffetch" accesskey="1">@octave_sqlite/fetch</a></li>
<li><a href="#g_t_0040octave_005fsqlite_002fsqlread" accesskey="2">@octave_sqlite/sqlread</a></li>
</ul>
<div class="subsection" id="g_t_0040octave_005fsqlite_002ffetch">
<h4 class="subsection">3.2.1 @octave_sqlite/fetch</h4>
<span id="index-fetch"></span>
<dl class="def">
<dt id="index-fetch-1"><span class="category">: </span><span><em><var>data</var> =</em> <strong>fetch</strong> <em>(<var>db</var>, <var>sqlquery</var>)</em><a href='#index-fetch-1' class='copiable-anchor'></a></span></dt>
<dt id="index-fetch-2"><span class="category">: </span><span><em><var>data</var> =</em> <strong>fetch</strong> <em>(<var>db</var>, <var>sqlquery</var>, <var>propertyname</var>, <var>propertyvalue</var> &hellip;)</em><a href='#index-fetch-2' class='copiable-anchor'></a></span></dt>
<dd><p>Run a SQL query on a sqlite database
</p>
<p>Return rows of data after running a SQL query on a sqlite database.
</p>
<span id="Inputs-3"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>currently open sqlite database.
 </p></dd>
<dt><span><var>sqlquery</var></span></dt>
<dd><p>String containing a valid select SQL query.
 </p></dd>
<dt><span><var>propertyname</var>, <var>propertyvalue</var></span></dt>
<dd><p>property name/value pairs where known properties are:
  </p><dl compact="compact">
<dt><span>MaxRows</span></dt>
<dd><p>Integer value of max number of rows in the query
  </p></dd>
<dt><span>VariableNamingRule</span></dt>
<dd><p>String value &rsquo;preserve&rsquo; (default) or &rsquo;modify&rsquo; to flag renaming of variable names (currently ignored)
  </p></dd>
</dl>
</dd>
</dl>
<span id="Outputs-3"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>data</var></span></dt>
<dd><p>a table containing the query result.
 </p></dd>
</dl>
<span id="Examples-1"></span><h4 class="subsubheading">Examples</h4>
<p>Select all rows of data from a database tables
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;);
 data = fetch(db, 'SELECT * FROM TestTable');
 </code>
 </pre></div>
<p>Select 5 rows of data from a database tables
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;);
 data = fetch(db, 'SELECT * FROM TestTable', &quot;MaxRows&quot;, 5);
 </code>
 </pre></div>
<p><strong>See also:</strong> sqlite, sqlread.
 </p></dd></dl>
</div>
<div class="subsection" id="g_t_0040octave_005fsqlite_002fsqlread">
<h4 class="subsection">3.2.2 @octave_sqlite/sqlread</h4>
<span id="index-sqlread"></span>
<dl class="def">
<dt id="index-sqlread-1"><span class="category">: </span><span><em><var>data</var> =</em> <strong>sqlread</strong> <em>(<var>db</var>, <var>tablename</var>)</em><a href='#index-sqlread-1' class='copiable-anchor'></a></span></dt>
<dt id="index-sqlread-2"><span class="category">: </span><span><em><var>data</var> =</em> <strong>sqlread</strong> <em>(<var>db</var>, <var>tablename</var>, <var>propertyname</var>, <var>propertyvalue</var> &hellip;)</em><a href='#index-sqlread-2' class='copiable-anchor'></a></span></dt>
<dd><p>Read rows of data from a table
</p>
<p>Return rows of data from table <var>tablename</var> in a sqlite database.
 This function is the equivalent of running SELECT * FROM <var>table</var>.
</p>
<span id="Inputs-4"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>currently open sqlite database.
 </p></dd>
<dt><span><var>tablename</var></span></dt>
<dd><p>Name of a table with the database.
 </p></dd>
<dt><span><var>propertyname</var>, <var>propertyvalue</var></span></dt>
<dd><p>property name/value pairs where known properties are:
  </p><dl compact="compact">
<dt><span>MaxRows</span></dt>
<dd><p>Integer value of max number of rows in the query
  </p></dd>
<dt><span>VariableNamingRule</span></dt>
<dd><p>String value &rsquo;preserve&rsquo; (default) or &rsquo;modify&rsquo; to flag renaming of variable names (currently ignored)
  </p></dd>
</dl>
</dd>
</dl>
<span id="Outputs-4"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>data</var></span></dt>
<dd><p>a table containing the query result.
 </p></dd>
</dl>
<span id="Examples-2"></span><h4 class="subsubheading">Examples</h4>
<p>Select all rows of data from a database table
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection to an existing database
 db = sqlite(&quot;mytest.db&quot;);
 data = sqlread(db, 'TestTable');
 </code>
 </pre></div>
<p>Select 5 rows of data from a database table
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;);
 data = sqlread(db, 'TestTable', &quot;MaxRows&quot;, 5);
 </code>
 </pre></div>
<p><strong>See also:</strong> sqlite, fetch.
 </p></dd></dl>
<hr>
</div>
</div>
<div class="section" id="Exporting-Data">
<div class="header">
<p>
Next: <a href="#Database-Operations" accesskey="n" rel="next">Database Operations</a>, Previous: <a href="#Importing-Data" accesskey="p" rel="prev">Importing Data</a>, Up: <a href="#Function-Reference" accesskey="u" rel="up">Function Reference</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Exporting-Data-1"></span><h3 class="section">3.3 Exporting Data</h3>
<span id="index-Exporting-Data"></span>
<ul class="section-toc">
<li><a href="#g_t_0040octave_005fsqlite_002fsqlwrite" accesskey="1">@octave_sqlite/sqlwrite</a></li>
</ul>
<div class="subsection" id="g_t_0040octave_005fsqlite_002fsqlwrite">
<h4 class="subsection">3.3.1 @octave_sqlite/sqlwrite</h4>
<span id="index-sqlwrite"></span>
<dl class="def">
<dt id="index-sqlwrite-1"><span class="category">: </span><span><em></em> <strong>sqlwrite</strong> <em>(<var>db</var>, <var>tablename</var>, <var>data</var>)</em><a href='#index-sqlwrite-1' class='copiable-anchor'></a></span></dt>
<dt id="index-sqlwrite-2"><span class="category">: </span><span><em></em> <strong>sqlwrite</strong> <em>(<var>db</var>, <var>tablename</var>, <var>data</var>, <var>columntypes</var>)</em><a href='#index-sqlwrite-2' class='copiable-anchor'></a></span></dt>
<dt id="index-sqlwrite-3"><span class="category">: </span><span><em></em> <strong>sqlwrite</strong> <em>(<var>db</var>, <var>tablename</var>, <var>data</var>, <var>propertyname</var>, <var>propertyvalue</var> &hellip;)</em><a href='#index-sqlwrite-3' class='copiable-anchor'></a></span></dt>
<dd><p>Insert rows of data into a table.
</p>
<p>Insert rows of data into a sqlite database table.
 If the table does not exist it will be created, using the ColumnType property if available
 otherwise, the type of input data will be used to determine field types.
</p>
<span id="Inputs-5"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
<dt><span><var>tablename</var></span></dt>
<dd><p>Name of table to write data to
 </p></dd>
<dt><span><var>data</var></span></dt>
<dd><p>Table containing data to write to the database. Variables names are expected to match the database.
 </p></dd>
<dt><span><var>columntypes</var></span></dt>
<dd><p>Optional cell array of same size as data used if table must be created. The column types may also
 be passed in using the <var>propertyname</var>, <var>propertyvalue</var> syntax.
 </p></dd>
<dt><span><var>propertyname</var>, <var>propertyvalue</var></span></dt>
<dd><p>property name/value pairs where known properties are:
  </p><dl compact="compact">
<dt><span>ColumnType</span></dt>
<dd><p>Optional cell array of same size as the data that may be used
  if the table is created as part of the write operation.
  </p></dd>
</dl>
</dd>
</dl>
<span id="Outputs-5"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<span id="Examples-3"></span><h4 class="subsubheading">Examples</h4>
<p>Create a database table and insert a row
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;, &quot;create&quot;);
 # create table (if it does not exist) and then insert 2 rows
 t = dbtable([1;2],['Name1';'Name2'], 'VariableNames', {'Id','Name'});
 # insert table data
 sqlwrite(db, &quot;Test&quot;, t, 'ColumnType', {'numeric', 'text'});
 </code>
 </pre></div>
<p><strong>See also:</strong> sqlite, execute.
 </p></dd></dl>
<hr>
</div>
</div>
<div class="section" id="Database-Operations">
<div class="header">
<p>
Next: <a href="#Support-Functions" accesskey="n" rel="next">Support Functions</a>, Previous: <a href="#Exporting-Data" accesskey="p" rel="prev">Exporting Data</a>, Up: <a href="#Function-Reference" accesskey="u" rel="up">Function Reference</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Database-Operations-1"></span><h3 class="section">3.4 Database Operations</h3>
<span id="index-Database-Operations"></span>
<ul class="section-toc">
<li><a href="#g_t_0040octave_005fsqlite_002fcommit" accesskey="1">@octave_sqlite/commit</a></li>
<li><a href="#g_t_0040octave_005fsqlite_002fexecute" accesskey="2">@octave_sqlite/execute</a></li>
<li><a href="#g_t_0040octave_005fsqlite_002frollback" accesskey="3">@octave_sqlite/rollback</a></li>
</ul>
<div class="subsection" id="g_t_0040octave_005fsqlite_002fcommit">
<h4 class="subsection">3.4.1 @octave_sqlite/commit</h4>
<span id="index-commit"></span>
<dl class="def">
<dt id="index-commit-1"><span class="category">: </span><span><em></em> <strong>commit</strong> <em>(<var>db</var>)</em><a href='#index-commit-1' class='copiable-anchor'></a></span></dt>
<dd><p>Commit changes to a database
</p>
<p>Commit pending transactions of sqlite connection that has AutoCommit = off set.
</p>
<span id="Inputs-6"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
</dl>
<span id="Outputs-6"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<span id="Examples-4"></span><h4 class="subsubheading">Examples</h4>
<p>Create a database table turn off autocommit and insert a row and commit
 </p><div class="example">
<pre class="example"> <code>
 # create sql connection
 db = sqlite(&quot;mytest.db&quot;);
 # create table
 execute(db, 'CREATE TABLE Test (Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT)');
 # turn off auto commit
 db.AutoCommit = &quot;off&quot;;
 execute(db, 'INSERT INTO Test (Name) VALUES (&quot;Line1&quot;)');
 # commit the insert
 commit(db);
 </code>
 </pre></div>
<p><strong>See also:</strong> sqlite, rollback.
 </p></dd></dl>
</div>
<div class="subsection" id="g_t_0040octave_005fsqlite_002fexecute">
<h4 class="subsection">3.4.2 @octave_sqlite/execute</h4>
<span id="index-execute"></span>
<dl class="def">
<dt id="index-execute-1"><span class="category">: </span><span><em></em> <strong>execute</strong> <em>(<var>db</var>, <var>sqlquery</var>)</em><a href='#index-execute-1' class='copiable-anchor'></a></span></dt>
<dd><p>Execute a SQL statement on a sqlite database
</p>
<p>Execute non select SQL query <var>sqlquery</var> on a sqlite database.
</p>
<span id="Inputs-7"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
<dt><span><var>sqlquery</var></span></dt>
<dd><p>A valid non selecting SQL query string
 </p></dd>
</dl>
<span id="Inputs-8"></span><h4 class="subsubheading">Inputs</h4>
<p>None
</p>
<span id="Examples-5"></span><h4 class="subsubheading">Examples</h4>
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
</div>
<div class="subsection" id="g_t_0040octave_005fsqlite_002frollback">
<h4 class="subsection">3.4.3 @octave_sqlite/rollback</h4>
<span id="index-rollback"></span>
<dl class="def">
<dt id="index-rollback-1"><span class="category">: </span><span><em></em> <strong>rollback</strong> <em>(<var>db</var>)</em><a href='#index-rollback-1' class='copiable-anchor'></a></span></dt>
<dd><p>Rollback changes to a database
</p>
<p>Rollback pending transactions of sqlite connection that has
 AutoCommit = off set.
</p>
<span id="Inputs-9"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>db</var></span></dt>
<dd><p>Previously created octave_sqlite object
 </p></dd>
</dl>
<span id="Outputs-7"></span><h4 class="subsubheading">Outputs</h4>
<p>None
</p>
<span id="Examples-6"></span><h4 class="subsubheading">Examples</h4>
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
<hr>
</div>
</div>
<div class="section" id="Support-Functions">
<div class="header">
<p>
Previous: <a href="#Database-Operations" accesskey="p" rel="prev">Database Operations</a>, Up: <a href="#Function-Reference" accesskey="u" rel="up">Function Reference</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Support-Functions-1"></span><h3 class="section">3.5 Support Functions</h3>
<span id="index-Support-Functions"></span>
<ul class="section-toc">
<li><a href="#dbtable" accesskey="1">dbtable</a></li>
<li><a href="#readdbtable" accesskey="2">readdbtable</a></li>
<li><a href="#struct2dbtable" accesskey="3">struct2dbtable</a></li>
</ul>
<div class="subsection" id="dbtable">
<h4 class="subsection">3.5.1 dbtable</h4>
<span id="index-dbtable"></span>
<dl class="def">
<dt id="index-dbtable_0028_0029"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable()</strong><a href='#index-dbtable_0028_0029' class='copiable-anchor'></a></span></dt>
<dt id="index-dbtable-1"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable</strong> <em>(<var>var1</var>, &hellip; <var>varn</var>)</em><a href='#index-dbtable-1' class='copiable-anchor'></a></span></dt>
<dt id="index-dbtable-2"><span class="category">: </span><span><em><var>table</var> =</em> <strong>dbtable</strong> <em>(&hellip; <var>propertyname</var>, <var>propertyvalue</var>)</em><a href='#index-dbtable-2' class='copiable-anchor'></a></span></dt>
<dd><p>Create a table of data
</p>
<p>dbtable is a basic implementation of a table type to avoid dependencies on other packages.
</p>
<span id="Inputs-10"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>var1</var> &hellip; <var>varn</var></span></dt>
<dd><p>Variables or data to be used as the column data of the table. When the input is a variable,
 the variable name will be used as the column name, otherwise the columns will be Var1 &hellip;
 VarN.
 </p></dd>
<dt><span><var>propertyname</var>, <var>propertyvalue</var></span></dt>
<dd><p>Property name/value pairs, where known property names are:
  </p><dl compact="compact">
<dt><span>VariableNames</span></dt>
<dd><p>A cell string matching the number of input columns with the name to use for the
  </p></dd>
<dt><span>DimensionNames</span></dt>
<dd><p>A cell string matching of length 2 for using as dimension access. If not specified
  it will be &quot;Rows&quot; and &quot;Variables&quot;.
  </p></dd>
</dl>
</dd>
</dl>
<span id="Outputs-8"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>table</var></span></dt>
<dd><p>a dbtable object
 </p></dd>
</dl>
<span id="Object-Properties-1"></span><h4 class="subsubheading">Object Properties</h4>
<p>A dbtable object has the following properties:
 </p><dl compact="compact">
<dt><span>Properties</span></dt>
<dd><p>A table properties struct.
</p>
<p>The table struct includes fields:
  </p><dl compact="compact">
<dt><span>Description</span></dt>
<dd><p>Text table description
  </p></dd>
<dt><span>DimensionNames</span></dt>
<dd><p>Cell array of Row and Variable dimension names
  </p></dd>
<dt><span>VariableNames</span></dt>
<dd><p>Cell array of variable (column) names
  </p></dd>
<dt><span>UserData</span></dt>
<dd><p>User data value
  </p></dd>
</dl>
</dd>
</dl>
<span id="Examples-7"></span><h4 class="subsubheading">Examples</h4>
<p>Directly create a 2 column table from input of each column
 </p><div class="example">
<pre class="example"> <code>
 t = dbtable([0;1;3], [2;4;6]);
 </code>
 </pre></div>
<p>Directly create a 2 column table from input of each column, and specify variable
 names
 </p><div class="example">
<pre class="example"> <code>
 t = dbtable([0;1;3], [2;4;6], &quot;VariableNames&quot;, {'Variable1', 'Variable2'});
 </code>
 </pre></div>
<p>Create a 2 column table from 2 variables V1, V2
 </p><div class="example">
<pre class="example"> <code>
 V1 = [0;1;3];
 V2 = [2;4;6];
 t = dbtable(V1, V2);
 </code>
 </pre></div>
<p><strong>See also:</strong> readdbtable, struct2dbtable.
 </p></dd></dl>
</div>
<div class="subsection" id="readdbtable">
<h4 class="subsection">3.5.2 readdbtable</h4>
<span id="index-readdbtable"></span>
<dl class="def">
<dt id="index-readdbtable-1"><span class="category">: </span><span><em><var>t</var> =</em> <strong>readdbtable</strong> <em>(<var>filename</var>)</em><a href='#index-readdbtable-1' class='copiable-anchor'></a></span></dt>
<dd><p>Create a dbtable from a file
</p>
<p>Currently, this is using a very simplistic approach to read data from a CSV
 formatted file only.
</p>
<span id="Inputs-11"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>filename</var></span></dt>
<dd><p>Filename for file containing tabular data
 </p></dd>
</dl>
<span id="Outputs-9"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>t</var></span></dt>
<dd><p>a dbtable of the read data
 </p></dd>
</dl>
</dd></dl>
</div>
<div class="subsection" id="struct2dbtable">
<h4 class="subsection">3.5.3 struct2dbtable</h4>
<span id="index-struct2dbtable"></span>
<dl class="def">
<dt id="index-struct2dbtable-1"><span class="category">: </span><span><em><var>t</var> =</em> <strong>struct2dbtable</strong> <em>(<var>astruct</var>)</em><a href='#index-struct2dbtable-1' class='copiable-anchor'></a></span></dt>
<dd><p>Create a dbtable from a struct
</p>
<p>This function uses the field names and data of the fields to create a table
 representation of the struct.
</p>
<p>Each fieldname will be a variable in the table. The data for each variable
 will be the data of the fieldname, and is expected to be a uniform size for
 all fields in the struct.
</p>
<span id="Inputs-12"></span><h4 class="subsubheading">Inputs</h4>
<dl compact="compact">
<dt><span><var>astruct</var></span></dt>
<dd><p>A struct with same number of elements in each field
 </p></dd>
</dl>
<span id="Outputs-10"></span><h4 class="subsubheading">Outputs</h4>
<dl compact="compact">
<dt><span><var>t</var></span></dt>
<dd><p>a dbtable of the <var>astruct</var> data
 </p></dd>
</dl>
</dd></dl>
<hr>
</div>
</div>
</div>
<div class="appendix" id="Copying">
<div class="header">
<p>
Next: <a href="#Index" accesskey="n" rel="next">Index</a>, Previous: <a href="#Function-Reference" accesskey="p" rel="prev">Function Reference</a>, Up: <a href="#Top" accesskey="u" rel="up">Introduction</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="GNU-General-Public-License"></span><h2 class="appendix">Appendix A GNU General Public License</h2>
<span id="index-warranty"></span>
<span id="index-copyright"></span>
<div align="center">Version 3, 29 June 2007
</div>
<div class="display">
<pre class="display">Copyright &copy; 2007 Free Software Foundation, Inc. <a href="http://fsf.org/">http://fsf.org/</a>
Everyone is permitted to copy and distribute verbatim copies of this
license document, but changing it is not allowed.
</pre></div>
<span id="Preamble"></span><h3 class="heading">Preamble</h3>
<p>The GNU General Public License is a free, copyleft license for
software and other kinds of works.
</p>
<p>The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom
to share and change all versions of a program&mdash;to make sure it remains
free software for all its users.  We, the Free Software Foundation,
use the GNU General Public License for most of our software; it
applies also to any other work released this way by its authors.  You
can apply it to your programs, too.
</p>
<p>When we speak of free software, we are referring to freedom, not
price.  Our General Public Licenses are designed to make sure that you
have the freedom to distribute copies of free software (and charge for
them if you wish), that you receive source code or can get it if you
want it, that you can change the software or use pieces of it in new
free programs, and that you know you can do these things.
</p>
<p>To protect your rights, we need to prevent others from denying you
these rights or asking you to surrender the rights.  Therefore, you
have certain responsibilities if you distribute copies of the
software, or if you modify it: responsibilities to respect the freedom
of others.
</p>
<p>For example, if you distribute copies of such a program, whether
gratis or for a fee, you must pass on to the recipients the same
freedoms that you received.  You must make sure that they, too,
receive or can get the source code.  And you must show them these
terms so they know their rights.
</p>
<p>Developers that use the GNU GPL protect your rights with two steps:
(1) assert copyright on the software, and (2) offer you this License
giving you legal permission to copy, distribute and/or modify it.
</p>
<p>For the developers&rsquo; and authors&rsquo; protection, the GPL clearly explains
that there is no warranty for this free software.  For both users&rsquo; and
authors&rsquo; sake, the GPL requires that modified versions be marked as
changed, so that their problems will not be attributed erroneously to
authors of previous versions.
</p>
<p>Some devices are designed to deny users access to install or run
modified versions of the software inside them, although the
manufacturer can do so.  This is fundamentally incompatible with the
aim of protecting users&rsquo; freedom to change the software.  The
systematic pattern of such abuse occurs in the area of products for
individuals to use, which is precisely where it is most unacceptable.
Therefore, we have designed this version of the GPL to prohibit the
practice for those products.  If such problems arise substantially in
other domains, we stand ready to extend this provision to those
domains in future versions of the GPL, as needed to protect the
freedom of users.
</p>
<p>Finally, every program is threatened constantly by software patents.
States should not allow patents to restrict development and use of
software on general-purpose computers, but in those that do, we wish
to avoid the special danger that patents applied to a free program
could make it effectively proprietary.  To prevent this, the GPL
assures that patents cannot be used to render the program non-free.
</p>
<p>The precise terms and conditions for copying, distribution and
modification follow.
</p>
<span id="TERMS-AND-CONDITIONS"></span><h3 class="heading">TERMS AND CONDITIONS</h3>
<ol start="0">
<li> Definitions.
<p>&ldquo;This License&rdquo; refers to version 3 of the GNU General Public License.
</p>
<p>&ldquo;Copyright&rdquo; also means copyright-like laws that apply to other kinds
of works, such as semiconductor masks.
</p>
<p>&ldquo;The Program&rdquo; refers to any copyrightable work licensed under this
License.  Each licensee is addressed as &ldquo;you&rdquo;.  &ldquo;Licensees&rdquo; and
&ldquo;recipients&rdquo; may be individuals or organizations.
</p>
<p>To &ldquo;modify&rdquo; a work means to copy from or adapt all or part of the work
in a fashion requiring copyright permission, other than the making of
an exact copy.  The resulting work is called a &ldquo;modified version&rdquo; of
the earlier work or a work &ldquo;based on&rdquo; the earlier work.
</p>
<p>A &ldquo;covered work&rdquo; means either the unmodified Program or a work based
on the Program.
</p>
<p>To &ldquo;propagate&rdquo; a work means to do anything with it that, without
permission, would make you directly or secondarily liable for
infringement under applicable copyright law, except executing it on a
computer or modifying a private copy.  Propagation includes copying,
distribution (with or without modification), making available to the
public, and in some countries other activities as well.
</p>
<p>To &ldquo;convey&rdquo; a work means any kind of propagation that enables other
parties to make or receive copies.  Mere interaction with a user
through a computer network, with no transfer of a copy, is not
conveying.
</p>
<p>An interactive user interface displays &ldquo;Appropriate Legal Notices&rdquo; to
the extent that it includes a convenient and prominently visible
feature that (1) displays an appropriate copyright notice, and (2)
tells the user that there is no warranty for the work (except to the
extent that warranties are provided), that licensees may convey the
work under this License, and how to view a copy of this License.  If
the interface presents a list of user commands or options, such as a
menu, a prominent item in the list meets this criterion.
</p>
</li><li> Source Code.
<p>The &ldquo;source code&rdquo; for a work means the preferred form of the work for
making modifications to it.  &ldquo;Object code&rdquo; means any non-source form
of a work.
</p>
<p>A &ldquo;Standard Interface&rdquo; means an interface that either is an official
standard defined by a recognized standards body, or, in the case of
interfaces specified for a particular programming language, one that
is widely used among developers working in that language.
</p>
<p>The &ldquo;System Libraries&rdquo; of an executable work include anything, other
than the work as a whole, that (a) is included in the normal form of
packaging a Major Component, but which is not part of that Major
Component, and (b) serves only to enable use of the work with that
Major Component, or to implement a Standard Interface for which an
implementation is available to the public in source code form.  A
&ldquo;Major Component&rdquo;, in this context, means a major essential component
(kernel, window system, and so on) of the specific operating system
(if any) on which the executable work runs, or a compiler used to
produce the work, or an object code interpreter used to run it.
</p>
<p>The &ldquo;Corresponding Source&rdquo; for a work in object code form means all
the source code needed to generate, install, and (for an executable
work) run the object code and to modify the work, including scripts to
control those activities.  However, it does not include the work&rsquo;s
System Libraries, or general-purpose tools or generally available free
programs which are used unmodified in performing those activities but
which are not part of the work.  For example, Corresponding Source
includes interface definition files associated with source files for
the work, and the source code for shared libraries and dynamically
linked subprograms that the work is specifically designed to require,
such as by intimate data communication or control flow between those
subprograms and other parts of the work.
</p>
<p>The Corresponding Source need not include anything that users can
regenerate automatically from other parts of the Corresponding Source.
</p>
<p>The Corresponding Source for a work in source code form is that same
work.
</p>
</li><li> Basic Permissions.
<p>All rights granted under this License are granted for the term of
copyright on the Program, and are irrevocable provided the stated
conditions are met.  This License explicitly affirms your unlimited
permission to run the unmodified Program.  The output from running a
covered work is covered by this License only if the output, given its
content, constitutes a covered work.  This License acknowledges your
rights of fair use or other equivalent, as provided by copyright law.
</p>
<p>You may make, run and propagate covered works that you do not convey,
without conditions so long as your license otherwise remains in force.
You may convey covered works to others for the sole purpose of having
them make modifications exclusively for you, or provide you with
facilities for running those works, provided that you comply with the
terms of this License in conveying all material for which you do not
control copyright.  Those thus making or running the covered works for
you must do so exclusively on your behalf, under your direction and
control, on terms that prohibit them from making any copies of your
copyrighted material outside their relationship with you.
</p>
<p>Conveying under any other circumstances is permitted solely under the
conditions stated below.  Sublicensing is not allowed; section 10
makes it unnecessary.
</p>
</li><li> Protecting Users&rsquo; Legal Rights From Anti-Circumvention Law.
<p>No covered work shall be deemed part of an effective technological
measure under any applicable law fulfilling obligations under article
11 of the WIPO copyright treaty adopted on 20 December 1996, or
similar laws prohibiting or restricting circumvention of such
measures.
</p>
<p>When you convey a covered work, you waive any legal power to forbid
circumvention of technological measures to the extent such
circumvention is effected by exercising rights under this License with
respect to the covered work, and you disclaim any intention to limit
operation or modification of the work as a means of enforcing, against
the work&rsquo;s users, your or third parties&rsquo; legal rights to forbid
circumvention of technological measures.
</p>
</li><li> Conveying Verbatim Copies.
<p>You may convey verbatim copies of the Program&rsquo;s source code as you
receive it, in any medium, provided that you conspicuously and
appropriately publish on each copy an appropriate copyright notice;
keep intact all notices stating that this License and any
non-permissive terms added in accord with section 7 apply to the code;
keep intact all notices of the absence of any warranty; and give all
recipients a copy of this License along with the Program.
</p>
<p>You may charge any price or no price for each copy that you convey,
and you may offer support or warranty protection for a fee.
</p>
</li><li> Conveying Modified Source Versions.
<p>You may convey a work based on the Program, or the modifications to
produce it from the Program, in the form of source code under the
terms of section 4, provided that you also meet all of these
conditions:
</p>
<ol type="a" start="1">
<li> The work must carry prominent notices stating that you modified it,
and giving a relevant date.
</li><li> The work must carry prominent notices stating that it is released
under this License and any conditions added under section 7.  This
requirement modifies the requirement in section 4 to &ldquo;keep intact all
notices&rdquo;.
</li><li> You must license the entire work, as a whole, under this License to
anyone who comes into possession of a copy.  This License will
therefore apply, along with any applicable section 7 additional terms,
to the whole of the work, and all its parts, regardless of how they
are packaged.  This License gives no permission to license the work in
any other way, but it does not invalidate such permission if you have
separately received it.
</li><li> If the work has interactive user interfaces, each must display
Appropriate Legal Notices; however, if the Program has interactive
interfaces that do not display Appropriate Legal Notices, your work
need not make them do so.
</li></ol>
<p>A compilation of a covered work with other separate and independent
works, which are not by their nature extensions of the covered work,
and which are not combined with it such as to form a larger program,
in or on a volume of a storage or distribution medium, is called an
&ldquo;aggregate&rdquo; if the compilation and its resulting copyright are not
used to limit the access or legal rights of the compilation&rsquo;s users
beyond what the individual works permit.  Inclusion of a covered work
in an aggregate does not cause this License to apply to the other
parts of the aggregate.
</p>
</li><li> Conveying Non-Source Forms.
<p>You may convey a covered work in object code form under the terms of
sections 4 and 5, provided that you also convey the machine-readable
Corresponding Source under the terms of this License, in one of these
ways:
</p>
<ol type="a" start="1">
<li> Convey the object code in, or embodied in, a physical product
(including a physical distribution medium), accompanied by the
Corresponding Source fixed on a durable physical medium customarily
used for software interchange.
</li><li> Convey the object code in, or embodied in, a physical product
(including a physical distribution medium), accompanied by a written
offer, valid for at least three years and valid for as long as you
offer spare parts or customer support for that product model, to give
anyone who possesses the object code either (1) a copy of the
Corresponding Source for all the software in the product that is
covered by this License, on a durable physical medium customarily used
for software interchange, for a price no more than your reasonable
cost of physically performing this conveying of source, or (2) access
to copy the Corresponding Source from a network server at no charge.
</li><li> Convey individual copies of the object code with a copy of the written
offer to provide the Corresponding Source.  This alternative is
allowed only occasionally and noncommercially, and only if you
received the object code with such an offer, in accord with subsection
6b.
</li><li> Convey the object code by offering access from a designated place
(gratis or for a charge), and offer equivalent access to the
Corresponding Source in the same way through the same place at no
further charge.  You need not require recipients to copy the
Corresponding Source along with the object code.  If the place to copy
the object code is a network server, the Corresponding Source may be
on a different server (operated by you or a third party) that supports
equivalent copying facilities, provided you maintain clear directions
next to the object code saying where to find the Corresponding Source.
Regardless of what server hosts the Corresponding Source, you remain
obligated to ensure that it is available for as long as needed to
satisfy these requirements.
</li><li> Convey the object code using peer-to-peer transmission, provided you
inform other peers where the object code and Corresponding Source of
the work are being offered to the general public at no charge under
subsection 6d.
</li></ol>
<p>A separable portion of the object code, whose source code is excluded
from the Corresponding Source as a System Library, need not be
included in conveying the object code work.
</p>
<p>A &ldquo;User Product&rdquo; is either (1) a &ldquo;consumer product&rdquo;, which means any
tangible personal property which is normally used for personal,
family, or household purposes, or (2) anything designed or sold for
incorporation into a dwelling.  In determining whether a product is a
consumer product, doubtful cases shall be resolved in favor of
coverage.  For a particular product received by a particular user,
&ldquo;normally used&rdquo; refers to a typical or common use of that class of
product, regardless of the status of the particular user or of the way
in which the particular user actually uses, or expects or is expected
to use, the product.  A product is a consumer product regardless of
whether the product has substantial commercial, industrial or
non-consumer uses, unless such uses represent the only significant
mode of use of the product.
</p>
<p>&ldquo;Installation Information&rdquo; for a User Product means any methods,
procedures, authorization keys, or other information required to
install and execute modified versions of a covered work in that User
Product from a modified version of its Corresponding Source.  The
information must suffice to ensure that the continued functioning of
the modified object code is in no case prevented or interfered with
solely because modification has been made.
</p>
<p>If you convey an object code work under this section in, or with, or
specifically for use in, a User Product, and the conveying occurs as
part of a transaction in which the right of possession and use of the
User Product is transferred to the recipient in perpetuity or for a
fixed term (regardless of how the transaction is characterized), the
Corresponding Source conveyed under this section must be accompanied
by the Installation Information.  But this requirement does not apply
if neither you nor any third party retains the ability to install
modified object code on the User Product (for example, the work has
been installed in ROM).
</p>
<p>The requirement to provide Installation Information does not include a
requirement to continue to provide support service, warranty, or
updates for a work that has been modified or installed by the
recipient, or for the User Product in which it has been modified or
installed.  Access to a network may be denied when the modification
itself materially and adversely affects the operation of the network
or violates the rules and protocols for communication across the
network.
</p>
<p>Corresponding Source conveyed, and Installation Information provided,
in accord with this section must be in a format that is publicly
documented (and with an implementation available to the public in
source code form), and must require no special password or key for
unpacking, reading or copying.
</p>
</li><li> Additional Terms.
<p>&ldquo;Additional permissions&rdquo; are terms that supplement the terms of this
License by making exceptions from one or more of its conditions.
Additional permissions that are applicable to the entire Program shall
be treated as though they were included in this License, to the extent
that they are valid under applicable law.  If additional permissions
apply only to part of the Program, that part may be used separately
under those permissions, but the entire Program remains governed by
this License without regard to the additional permissions.
</p>
<p>When you convey a copy of a covered work, you may at your option
remove any additional permissions from that copy, or from any part of
it.  (Additional permissions may be written to require their own
removal in certain cases when you modify the work.)  You may place
additional permissions on material, added by you to a covered work,
for which you have or can give appropriate copyright permission.
</p>
<p>Notwithstanding any other provision of this License, for material you
add to a covered work, you may (if authorized by the copyright holders
of that material) supplement the terms of this License with terms:
</p>
<ol type="a" start="1">
<li> Disclaiming warranty or limiting liability differently from the terms
of sections 15 and 16 of this License; or
</li><li> Requiring preservation of specified reasonable legal notices or author
attributions in that material or in the Appropriate Legal Notices
displayed by works containing it; or
</li><li> Prohibiting misrepresentation of the origin of that material, or
requiring that modified versions of such material be marked in
reasonable ways as different from the original version; or
</li><li> Limiting the use for publicity purposes of names of licensors or
authors of the material; or
</li><li> Declining to grant rights under trademark law for use of some trade
names, trademarks, or service marks; or
</li><li> Requiring indemnification of licensors and authors of that material by
anyone who conveys the material (or modified versions of it) with
contractual assumptions of liability to the recipient, for any
liability that these contractual assumptions directly impose on those
licensors and authors.
</li></ol>
<p>All other non-permissive additional terms are considered &ldquo;further
restrictions&rdquo; within the meaning of section 10.  If the Program as you
received it, or any part of it, contains a notice stating that it is
governed by this License along with a term that is a further
restriction, you may remove that term.  If a license document contains
a further restriction but permits relicensing or conveying under this
License, you may add to a covered work material governed by the terms
of that license document, provided that the further restriction does
not survive such relicensing or conveying.
</p>
<p>If you add terms to a covered work in accord with this section, you
must place, in the relevant source files, a statement of the
additional terms that apply to those files, or a notice indicating
where to find the applicable terms.
</p>
<p>Additional terms, permissive or non-permissive, may be stated in the
form of a separately written license, or stated as exceptions; the
above requirements apply either way.
</p>
</li><li> Termination.
<p>You may not propagate or modify a covered work except as expressly
provided under this License.  Any attempt otherwise to propagate or
modify it is void, and will automatically terminate your rights under
this License (including any patent licenses granted under the third
paragraph of section 11).
</p>
<p>However, if you cease all violation of this License, then your license
from a particular copyright holder is reinstated (a) provisionally,
unless and until the copyright holder explicitly and finally
terminates your license, and (b) permanently, if the copyright holder
fails to notify you of the violation by some reasonable means prior to
60 days after the cessation.
</p>
<p>Moreover, your license from a particular copyright holder is
reinstated permanently if the copyright holder notifies you of the
violation by some reasonable means, this is the first time you have
received notice of violation of this License (for any work) from that
copyright holder, and you cure the violation prior to 30 days after
your receipt of the notice.
</p>
<p>Termination of your rights under this section does not terminate the
licenses of parties who have received copies or rights from you under
this License.  If your rights have been terminated and not permanently
reinstated, you do not qualify to receive new licenses for the same
material under section 10.
</p>
</li><li> Acceptance Not Required for Having Copies.
<p>You are not required to accept this License in order to receive or run
a copy of the Program.  Ancillary propagation of a covered work
occurring solely as a consequence of using peer-to-peer transmission
to receive a copy likewise does not require acceptance.  However,
nothing other than this License grants you permission to propagate or
modify any covered work.  These actions infringe copyright if you do
not accept this License.  Therefore, by modifying or propagating a
covered work, you indicate your acceptance of this License to do so.
</p>
</li><li> Automatic Licensing of Downstream Recipients.
<p>Each time you convey a covered work, the recipient automatically
receives a license from the original licensors, to run, modify and
propagate that work, subject to this License.  You are not responsible
for enforcing compliance by third parties with this License.
</p>
<p>An &ldquo;entity transaction&rdquo; is a transaction transferring control of an
organization, or substantially all assets of one, or subdividing an
organization, or merging organizations.  If propagation of a covered
work results from an entity transaction, each party to that
transaction who receives a copy of the work also receives whatever
licenses to the work the party&rsquo;s predecessor in interest had or could
give under the previous paragraph, plus a right to possession of the
Corresponding Source of the work from the predecessor in interest, if
the predecessor has it or can get it with reasonable efforts.
</p>
<p>You may not impose any further restrictions on the exercise of the
rights granted or affirmed under this License.  For example, you may
not impose a license fee, royalty, or other charge for exercise of
rights granted under this License, and you may not initiate litigation
(including a cross-claim or counterclaim in a lawsuit) alleging that
any patent claim is infringed by making, using, selling, offering for
sale, or importing the Program or any portion of it.
</p>
</li><li> Patents.
<p>A &ldquo;contributor&rdquo; is a copyright holder who authorizes use under this
License of the Program or a work on which the Program is based.  The
work thus licensed is called the contributor&rsquo;s &ldquo;contributor version&rdquo;.
</p>
<p>A contributor&rsquo;s &ldquo;essential patent claims&rdquo; are all patent claims owned
or controlled by the contributor, whether already acquired or
hereafter acquired, that would be infringed by some manner, permitted
by this License, of making, using, or selling its contributor version,
but do not include claims that would be infringed only as a
consequence of further modification of the contributor version.  For
purposes of this definition, &ldquo;control&rdquo; includes the right to grant
patent sublicenses in a manner consistent with the requirements of
this License.
</p>
<p>Each contributor grants you a non-exclusive, worldwide, royalty-free
patent license under the contributor&rsquo;s essential patent claims, to
make, use, sell, offer for sale, import and otherwise run, modify and
propagate the contents of its contributor version.
</p>
<p>In the following three paragraphs, a &ldquo;patent license&rdquo; is any express
agreement or commitment, however denominated, not to enforce a patent
(such as an express permission to practice a patent or covenant not to
sue for patent infringement).  To &ldquo;grant&rdquo; such a patent license to a
party means to make such an agreement or commitment not to enforce a
patent against the party.
</p>
<p>If you convey a covered work, knowingly relying on a patent license,
and the Corresponding Source of the work is not available for anyone
to copy, free of charge and under the terms of this License, through a
publicly available network server or other readily accessible means,
then you must either (1) cause the Corresponding Source to be so
available, or (2) arrange to deprive yourself of the benefit of the
patent license for this particular work, or (3) arrange, in a manner
consistent with the requirements of this License, to extend the patent
license to downstream recipients.  &ldquo;Knowingly relying&rdquo; means you have
actual knowledge that, but for the patent license, your conveying the
covered work in a country, or your recipient&rsquo;s use of the covered work
in a country, would infringe one or more identifiable patents in that
country that you have reason to believe are valid.
</p>
<p>If, pursuant to or in connection with a single transaction or
arrangement, you convey, or propagate by procuring conveyance of, a
covered work, and grant a patent license to some of the parties
receiving the covered work authorizing them to use, propagate, modify
or convey a specific copy of the covered work, then the patent license
you grant is automatically extended to all recipients of the covered
work and works based on it.
</p>
<p>A patent license is &ldquo;discriminatory&rdquo; if it does not include within the
scope of its coverage, prohibits the exercise of, or is conditioned on
the non-exercise of one or more of the rights that are specifically
granted under this License.  You may not convey a covered work if you
are a party to an arrangement with a third party that is in the
business of distributing software, under which you make payment to the
third party based on the extent of your activity of conveying the
work, and under which the third party grants, to any of the parties
who would receive the covered work from you, a discriminatory patent
license (a) in connection with copies of the covered work conveyed by
you (or copies made from those copies), or (b) primarily for and in
connection with specific products or compilations that contain the
covered work, unless you entered into that arrangement, or that patent
license was granted, prior to 28 March 2007.
</p>
<p>Nothing in this License shall be construed as excluding or limiting
any implied license or other defenses to infringement that may
otherwise be available to you under applicable patent law.
</p>
</li><li> No Surrender of Others&rsquo; Freedom.
<p>If conditions are imposed on you (whether by court order, agreement or
otherwise) that contradict the conditions of this License, they do not
excuse you from the conditions of this License.  If you cannot convey
a covered work so as to satisfy simultaneously your obligations under
this License and any other pertinent obligations, then as a
consequence you may not convey it at all.  For example, if you agree
to terms that obligate you to collect a royalty for further conveying
from those to whom you convey the Program, the only way you could
satisfy both those terms and this License would be to refrain entirely
from conveying the Program.
</p>
</li><li> Use with the GNU Affero General Public License.
<p>Notwithstanding any other provision of this License, you have
permission to link or combine any covered work with a work licensed
under version 3 of the GNU Affero General Public License into a single
combined work, and to convey the resulting work.  The terms of this
License will continue to apply to the part which is the covered work,
but the special requirements of the GNU Affero General Public License,
section 13, concerning interaction through a network will apply to the
combination as such.
</p>
</li><li> Revised Versions of this License.
<p>The Free Software Foundation may publish revised and/or new versions
of the GNU General Public License from time to time.  Such new
versions will be similar in spirit to the present version, but may
differ in detail to address new problems or concerns.
</p>
<p>Each version is given a distinguishing version number.  If the Program
specifies that a certain numbered version of the GNU General Public
License &ldquo;or any later version&rdquo; applies to it, you have the option of
following the terms and conditions either of that numbered version or
of any later version published by the Free Software Foundation.  If
the Program does not specify a version number of the GNU General
Public License, you may choose any version ever published by the Free
Software Foundation.
</p>
<p>If the Program specifies that a proxy can decide which future versions
of the GNU General Public License can be used, that proxy&rsquo;s public
statement of acceptance of a version permanently authorizes you to
choose that version for the Program.
</p>
<p>Later license versions may give you additional or different
permissions.  However, no additional obligations are imposed on any
author or copyright holder as a result of your choosing to follow a
later version.
</p>
</li><li> Disclaimer of Warranty.
<p>THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY
APPLICABLE LAW.  EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT
HOLDERS AND/OR OTHER PARTIES PROVIDE THE PROGRAM &ldquo;AS IS&rdquo; WITHOUT
WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND
PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE PROGRAM PROVE
DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR OR
CORRECTION.
</p>
</li><li> Limitation of Liability.
<p>IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MODIFIES AND/OR
CONVEYS THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
ARISING OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT
NOT LIMITED TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR
LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM
TO OPERATE WITH ANY OTHER PROGRAMS), EVEN IF SUCH HOLDER OR OTHER
PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
</p>
</li><li> Interpretation of Sections 15 and 16.
<p>If the disclaimer of warranty and limitation of liability provided
above cannot be given local legal effect according to their terms,
reviewing courts shall apply local law that most closely approximates
an absolute waiver of all civil liability in connection with the
Program, unless a warranty or assumption of liability accompanies a
copy of the Program in return for a fee.
</p>
</li></ol>
<span id="END-OF-TERMS-AND-CONDITIONS"></span><h3 class="heading">END OF TERMS AND CONDITIONS</h3>
<span id="How-to-Apply-These-Terms-to-Your-New-Programs"></span><h3 class="heading">How to Apply These Terms to Your New Programs</h3>
<p>If you develop a new program, and you want it to be of the greatest
possible use to the public, the best way to achieve this is to make it
free software which everyone can redistribute and change under these
terms.
</p>
<p>To do so, attach the following notices to the program.  It is safest
to attach them to the start of each source file to most effectively
state the exclusion of warranty; and each file should have at least
the &ldquo;copyright&rdquo; line and a pointer to where the full notice is found.
</p>
<div class="example">
<pre class="example"><var>one line to give the program's name and a brief idea of what it does.</var>  
Copyright (C) <var>year</var> <var>name of author</var>
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.
This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <a href="http://www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>.
</pre></div>
<p>Also add information on how to contact you by electronic and paper mail.
</p>
<p>If the program does terminal interaction, make it output a short
notice like this when it starts in an interactive mode:
</p>
<div class="example">
<pre class="example"><var>program</var> Copyright (C) <var>year</var> <var>name of author</var> 
This program comes with ABSOLUTELY NO WARRANTY; for details type &lsquo;<samp>show w</samp>&rsquo;.
This is free software, and you are welcome to redistribute it
under certain conditions; type &lsquo;<samp>show c</samp>&rsquo; for details.
</pre></div>
<p>The hypothetical commands &lsquo;<samp>show w</samp>&rsquo; and &lsquo;<samp>show c</samp>&rsquo; should show
the appropriate parts of the General Public License.  Of course, your
program&rsquo;s commands might be different; for a GUI interface, you would
use an &ldquo;about box&rdquo;.
</p>
<p>You should also get your employer (if you work as a programmer) or school,
if any, to sign a &ldquo;copyright disclaimer&rdquo; for the program, if necessary.
For more information on this, and how to apply and follow the GNU GPL, see
<a href="http://www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>.
</p>
<p>The GNU General Public License does not permit incorporating your
program into proprietary programs.  If your program is a subroutine
library, you may consider it more useful to permit linking proprietary
applications with the library.  If this is what you want to do, use
the GNU Lesser General Public License instead of this License.  But
first, please read <a href="http://www.gnu.org/philosophy/why-not-lgpl.html">http://www.gnu.org/philosophy/why-not-lgpl.html</a>.
</p>
<hr>
</div>
<div class="unnumbered" id="Index">
<div class="header">
<p>
Previous: <a href="#Copying" accesskey="p" rel="prev">GNU General Public License</a>, Up: <a href="#Top" accesskey="u" rel="up">Introduction</a> &nbsp; [<a href="#SEC_Contents" title="Table of contents" rel="contents">Contents</a>][<a href="#Index" title="Index" rel="index">Index</a>]</p>
</div>
<span id="Index-1"></span><h2 class="unnumbered">Index</h2>
 
<table><tr><th valign="top">Jump to: &nbsp; </th><td><a class="summary-letter" href="#Index_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-I"><b>I</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-L"><b>L</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-O"><b>O</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-R"><b>R</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-S"><b>S</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-W"><b>W</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-cp" border="0">
<tr><td></td><th align="left">Index Entry</th><td>&nbsp;</td><th align="left"> Section</th></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-B">B</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-Basic-Usage-Overview">Basic Usage Overview</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Basic-Usage-Overview">Basic Usage Overview</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-C">C</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-close">close</a>:</td><td>&nbsp;</td><td valign="top"><a href="#SQLITE-connection">SQLITE connection</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-Close-the-database">Close the database</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Basic-Usage-Overview">Basic Usage Overview</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-commit">commit</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Database-Operations">Database Operations</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-Connection-to-a-sqlite-database">Connection to a sqlite database</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Basic-Usage-Overview">Basic Usage Overview</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-copyright">copyright</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Copying">Copying</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-D">D</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-Database-Operations">Database Operations</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Database-Operations">Database Operations</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-dbtable">dbtable</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Support-Functions">Support Functions</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-E">E</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-execute">execute</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Database-Operations">Database Operations</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-Exporting-Data">Exporting Data</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Exporting-Data">Exporting Data</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-F">F</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-fetch">fetch</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Importing-Data">Importing Data</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-Function-Reference">Function Reference</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Function-Reference">Function Reference</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-I">I</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-Importing-Data">Importing Data</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Importing-Data">Importing Data</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-Installing-and-loading">Installing and loading</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-isopen">isopen</a>:</td><td>&nbsp;</td><td valign="top"><a href="#SQLITE-connection">SQLITE connection</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-L">L</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-Loading">Loading</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-O">O</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-Off_002dline-install">Off-line install</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-Online-install">Online install</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Installing-and-loading">Installing and loading</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-R">R</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-Read-a-table">Read a table</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Basic-Usage-Overview">Basic Usage Overview</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-readdbtable">readdbtable</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Support-Functions">Support Functions</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-rollback">rollback</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Database-Operations">Database Operations</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-S">S</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-sqlite">sqlite</a>:</td><td>&nbsp;</td><td valign="top"><a href="#SQLITE-connection">SQLITE connection</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-SQLITE-connection">SQLITE connection</a>:</td><td>&nbsp;</td><td valign="top"><a href="#SQLITE-connection">SQLITE connection</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-sqlread">sqlread</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Importing-Data">Importing Data</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-sqlwrite">sqlwrite</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Exporting-Data">Exporting Data</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-struct2dbtable">struct2dbtable</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Support-Functions">Support Functions</a></td></tr>
<tr><td></td><td valign="top"><a href="#index-Support-Functions">Support Functions</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Support-Functions">Support Functions</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
<tr><th id="Index_cp_letter-W">W</th><td></td><td></td></tr>
<tr><td></td><td valign="top"><a href="#index-warranty">warranty</a>:</td><td>&nbsp;</td><td valign="top"><a href="#Copying">Copying</a></td></tr>
<tr><td colspan="4"> <hr></td></tr>
</table>
<table><tr><th valign="top">Jump to: &nbsp; </th><td><a class="summary-letter" href="#Index_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-I"><b>I</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-L"><b>L</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-O"><b>O</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-R"><b>R</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-S"><b>S</b></a>
 &nbsp; 
<a class="summary-letter" href="#Index_cp_letter-W"><b>W</b></a>
 &nbsp; 
</td></tr></table>
 
</div>
</div>
