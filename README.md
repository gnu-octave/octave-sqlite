# Octave SQLITE Toolkit

SQLITE database access for GNU Octave

## Overview

This is a basic sqlite toolkit using and interface similar to
the Matlab Native SQLITE interface.

It provides functionality for the following functions:

* sqlite - create a sqlite database connection
* close - close a sqlite database connection
* fetch - fetch data from a connection using sql
* execute - execute a non selecting sql statement 
* sqlfind - query info about a sqlite table
* sqlread - read a sqlite table
* sqlwrite - write to a sqlite table
* sqlupdate - update a sqlite table
* commit - commit transaction when not in autocommit mode
* rollback - rollback a transaction when not in autocommit mode
* isopen - verify the database is open

It also provides a basic table implementation `dbtable`, but will also use
a table class if available.

## Installing the Toolkit

The toolkit can be installed in Octave 6.0 and greater.  It has a dependency 
on the SQLITE library (<https://www.sqlite.org/>), so it must be installed in 
order to successfully install the toolkit.

The toolkit can be installed in Octave 7.2+ using the command:

    pkg install -forge sqlite

On older versions of Octave, install the package using the full path to the latest released version:

    pkg install "https://github.com/gnu-octave/octave-sqlite/releases/download/v0.1.0/octave-sqlite-0.1.0.tar.gz"

After installation, load the package in order to use it.

    pkg load sqlite

**Note:** The package needs to loaded each time Octave is run in order to use the package. 

## Documentation

On newer versions of Octave, on loading the package the documentation will be available in the
Octave documentation pages.

The Documentation is also installed as a pdf in the installed package folder.

Online documentation is also available at
https://gnu-octave.github.io/octave-sqlite/

## Reporting Bugs

Bugs can be filed on the [issue tracker](https://github.com/gnu-octave/octave-sqlite/issues).
