# Octave SQLITE Toolkit

SQLITE database access for GNU Octave

## Overview

This is a basic sqlite toolkit using and interface similar to
the Matlab Native SQLITE interface.

It provides functionality for the following functions:

* sqlite
* fetch
* execute
* sqlread
* sqlwrite
* commit
* rollback
* isopen

## Installing the Toolkit

The toolkit can be installed in Octave 4.0 and greater.  It has a dependency 
on the SQLITE library (<https://www.sqlite.org/>), so it must be installed in 
order to successfully install the toolkit.

The toolkit can be installed in Octave 7.2+ using the command:

    pkg install -forge sqlite

On older versions of Octave, install using the pull path to the latest released version:

    pkg install "https://github.com/gnu-octave/octave-sqlite/archive/refs/tags/release-0.0.1.tar.gz"

After installation, load the package in order to use it.

    pkg load sqlite

**Note:** The package needs to loaded each time Octave is run in order to use the package. 

## Documentation

On newer versions of Octave, on loading the package the documentation will be available in the
Octave documentation pages.

The Documentation is also installed as a pdf in the installed package folder.

An online summary of the documentation is also available at
https://github.com/gnu-octave/octave-sqlite/wiki/Octave-SQLITE-Toolkit

## Reporting Bugs

Bugs can be filed on the [issue tracker](https://github.com/gnu-octave/octave-sqlite/issues).
