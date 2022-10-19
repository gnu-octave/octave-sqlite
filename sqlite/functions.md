---
layout: "function_list"
permalink: "/functions"
title: "Sqlite Toolkit - Functions"
pkg_name: "sqlite"
version: "0.0.1"
description: "Basic Octave implementation of sqlite toolkit"
categories:
- id: "17_SQLITEconnection"
  description: "SQLITE connection"
  functions:
  - id: "6_sqlite"
    name: "sqlite"
    description: "Create a sqlite database connection"
    url: "./sqlite/functions/6_sqlite"
  - id: "21_octavesqliteisopen"
    name: "@octave_sqlite/isopen"
    description: "Return true if the sqlite connection is open."
    url: "./sqlite/functions/@octave_sqlite/21_octavesqliteisopen"
  - id: "20_octavesqliteclose"
    name: "@octave_sqlite/close"
    description: "Close the sqlite connection represented by the object DB."
    url: "./sqlite/functions/@octave_sqlite/20_octavesqliteclose"
- id: "14_ImportingData"
  description: "Importing Data"
  functions:
  - id: "20_octavesqlitefetch"
    name: "@octave_sqlite/fetch"
    description: "Return rows of data after runnning a sql query on a sqlite database."
    url: "./sqlite/functions/@octave_sqlite/20_octavesqlitefetch"
  - id: "22_octavesqlitesqlread"
    name: "@octave_sqlite/sqlread"
    description: "Return rows of data from table TABLENAME in a sqlite database."
    url: "./sqlite/functions/@octave_sqlite/22_octavesqlitesqlread"
- id: "14_ExportingData"
  description: "Exporting Data"
  functions:
  - id: "23_octavesqlitesqlwrite"
    name: "@octave_sqlite/sqlwrite"
    description: "Insert rows of data from TABLENAME."
    url: "./sqlite/functions/@octave_sqlite/23_octavesqlitesqlwrite"
- id: "19_DatabaseOperations"
  description: "Database Operations"
  functions:
  - id: "21_octavesqlitecommit"
    name: "@octave_sqlite/commit"
    description: "Commit pending transactions of sqlite connection."
    url: "./sqlite/functions/@octave_sqlite/21_octavesqlitecommit"
  - id: "22_octavesqliteexecute"
    name: "@octave_sqlite/execute"
    description: "Execute non select sql query SQLQUERY on a sqlite database."
    url: "./sqlite/functions/@octave_sqlite/22_octavesqliteexecute"
  - id: "23_octavesqliterollback"
    name: "@octave_sqlite/rollback"
    description: "Rollback pending transactions of sqlite connection."
    url: "./sqlite/functions/@octave_sqlite/23_octavesqliterollback"
- id: "17_SupportFunctions"
  description: "Support Functions"
  functions:
  - id: "7_dbtable"
    name: "dbtable"
    description: "Basic implementation of a table type to avoid dependancies on other packages."
    url: "./sqlite/functions/7_dbtable"
  - id: "14_struct2dbtable"
    name: "struct2dbtable"
    description: "Create a dbtable from a struct"
    url: "./sqlite/functions/14_struct2dbtable"
navigation:
- id: "overview"
  name: "Overview"
  url: "/index"
- id: "Functions"
  name: "Function Reference"
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