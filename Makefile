## Copyright 2022 John Donoghue <john.donoghue@ieee.org>
##
## Copying and distribution of this file, with or without modification,
## are permitted in any medium without royalty provided the copyright
## notice and this notice are preserved.  This file is offered as-is,
## without any warranty.

TOPDIR := $(shell pwd)

## Some basic tools (can be overriden using environment variables)
SED ?= sed
TAR ?= tar
GREP ?= grep
CUT ?= cut
TR ?= tr
TEXI2PDF  ?= texi2pdf -q
MAKEINFO  ?= makeinfo
MAKEINFO_HTML_OPTIONS := --no-headers --set-customization-variable 'COPIABLE_LINKS 0' --set-customization-variable 'COPIABLE_ANCHORS 0' --no-split 

# work out a possible help generator
ifeq ($(strip $(QHELPGENERATOR)),)
  ifneq ($(shell qhelpgenerator-qt5 -v 2>/dev/null),)
    QHELPGENERATOR = qhelpgenerator-qt5
  else ifneq ($(shell qcollectiongenerator-qt5 -v 2>/dev/null),)
    QHELPGENERATOR = qcollectiongenerator-qt5
  else ifneq ($(shell qcollectiongenerator -qt5 -v 2>/dev/null),)
    QHELPGENERATOR = qcollectiongenerator -qt5
  #else ifneq ($(shell qhelpgenerator -qt5 -v 2>/dev/null),)
  #  # qt4 version wont error on-qt5 but also wont work
  #  QHELPGENERATOR = qhelpgenerator -qt5
  else
    QHELPGENERATOR = true
  endif
endif

## Note the use of ':=' (immediate set) and not just '=' (lazy set).
## http://stackoverflow.com/a/448939/1609556
package := $(shell $(GREP) "^Name: " DESCRIPTION | $(CUT) -f2 -d" " | \
$(TR) '[:upper:]' '[:lower:]')
packageprefix := octave-
version := $(shell $(GREP) "^Version: " DESCRIPTION | $(CUT) -f2 -d" ")
pkg_date := $(shell $(GREP) "^Date: " DESCRIPTION | $(CUT) -f2 -d" ")

## These are the paths that will be created for the releases.
target_dir       := target
release_dir      := $(target_dir)/$(packageprefix)$(package)-$(version)
release_tarball  := $(target_dir)/$(packageprefix)$(package)-$(version).tar.gz
html_dir         := $(target_dir)/$(package)-html
html_tarball     := $(target_dir)/$(package)-html.tar.gz
## Using $(realpath ...) avoids problems with symlinks due to bug
## #50994 in Octaves scripts/pkg/private/install.m.  But at least the
## release directory above is needed in the relative form, for 'git
## archive --format=tar --prefix=$(release_dir).
real_target_dir  := $(realpath .)/$(target_dir)
installation_dir := $(real_target_dir)/.installation
package_list     := $(installation_dir)/.octave_packages
install_stamp    := $(installation_dir)/.install_stamp

## These can be set by environment variables which allow to easily
## test with different Octave versions.
ifndef OCTAVE
OCTAVE := octave
endif
OCTAVE := $(OCTAVE) --silent --norc
MKOCTFILE ?= mkoctfile

## Command used to set permissions before creating tarballs
FIX_PERMISSIONS ?= chmod -R a+rX,u+w,go-w,ug-s

## Detect which VCS is used
vcs := $(if $(wildcard .hg),hg,$(if $(wildcard .git),git,unknown))
ifeq ($(vcs),hg)
release_dir_dep := .hg/dirstate
HG           := hg
HG_CMD        = $(HG) --config alias.$(1)=$(1) --config defaults.$(1)= $(1)
HG_ID        := $(shell $(call HG_CMD,identify) --id | sed -e 's/+//' )
REPO_TIMESTAMP := $(firstword $(shell $(call HG_CMD,log) --rev $(HG_ID) --template '{date|hgdate}'))
endif
ifeq ($(vcs),git)
release_dir_dep := .git/index
GIT          := git
REPO_TIMESTAMP := $(firstword $(shell $(GIT) log -n1 --date=unix --format="%ad"))
endif

# tar options for creating reproductable tarballs
TAR_REPRODUCIBLE_OPTIONS := --sort=name --mtime="@$(REPO_TIMESTAMP)" --owner=0 --group=0 --numeric-owner
TAR_OPTIONS  := --format=ustar $(TAR_REPRODUCIBLE_OPTIONS)



## .PHONY indicates targets that are not filenames
## (https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html)
.PHONY: help

## make will display the command before runnning them.  Use @command
## to not display it (makes specially sense for echo).
help:
	@echo "Targets:"
	@echo "   dist    - Create $(release_tarball) for release."
	@echo "   html    - Create $(html_tarball) for release."
	@echo "   release - Create both of the above and show md5sums."
	@echo "   install - Install the package in $(installation_dir), where it is not visible in a normal Octave session."
	@echo "   check   - Execute package tests."
	@echo "   doctest - Test the help texts with the doctest package."
	@echo "   run     - Run Octave with the package installed in $(installation_dir) in the path."
	@echo "   clean   - Remove everything made with this Makefile."


##
## Recipes for release tarballs (package + html)
##

.PHONY: release dist html clean-tarballs clean-unpacked-release

## To make a release, build the distribution and html tarballs.
release: dist html
	md5sum $(release_tarball) $(html_tarball)
	@echo "Upload @ https://sourceforge.net/p/octave/package-releases/new/"
	@echo "    and note the changeset the release corresponds to"

## dist and html targets are only PHONY/alias targets to the release
## and html tarballs.
dist: $(release_tarball)
html: $(html_tarball)

## An implicit rule with a recipe to build the tarballs correctly.
%.tar.gz: %
	$(TAR) -cf - $(TAR_OPTIONS) -C "$(target_dir)/" "$(notdir $<)" | gzip -9n > "$@"

clean-tarballs:
	@echo "## Cleaning release tarballs (package + html)..."
	-$(RM) $(release_tarball) $(html_tarball)
	@echo

## Create the unpacked package.
##
## Notes:
##    * having ".hg/dirstate" (or ".git/index") as a prerequesite means it is
##      only rebuilt if we are at a different commit.
##    * the variable RM usually defaults to "rm -f"
##    * having this recipe separate from the one that makes the tarball
##      makes it easy to have packages in alternative formats (such as zip)
##    * note that if a commands needs to be run in a specific directory,
##      the command to "cd" needs to be on the same line.  Each line restores
##      the original working directory.
$(release_dir): $(release_dir_dep)
	-$(RM) -r "$@"
ifeq (${vcs},hg)
	hg archive --exclude ".hg*" --type files "$@"
endif
ifeq (${vcs},git)
	git archive --format=tar --prefix="$@/" HEAD | $(TAR) -x
	$(RM) "$@/.gitignore"
endif
## Don't fall back to run the supposed necessary contents of
## 'bootstrap' here. Users are better off if they provide
## 'bootstrap'. Administrators, checking build reproducibility, can
## put in the missing 'bootstrap' file if they feel they know its
## necessary contents.
ifneq (,$(wildcard src/bootstrap))
	cd "$@/src" && ./bootstrap && $(RM) -r "autom4te.cache"
endif
## Uncomment this if your src/Makefile.in has these targets for
## pre-building something for the release (e.g. documentation).
ifneq (,$(wildcard src/configure))
	cd "$@/src" && ./configure && $(MAKE) prebuild && \
	  $(MAKE) distclean && $(RM) Makefile
endif
ifneq (,$(wildcard doc/mkfuncdocs.py))
	$(MAKE) -C "$@" docs
	cd "$@" && $(RM) -f doc/mkfuncdocs.py doc/mkqhcp.py
endif
	${FIX_PERMISSIONS} "$@"

run_in_place = $(OCTAVE) --eval ' pkg ("local_list", "$(package_list)"); ' \
                         --eval ' pkg ("load", "$(package)"); '

html_options = --eval 'options = get_html_options ("octave-forge");' \
               --eval 'options.package_doc = "$(packageprefix)$(package).texi";' \
	       --eval 'options.package_doc_options = [options.package_doc_options " --css-include=$(packageprefix)$(package).css"];'
$(html_dir): $(install_stamp)
	$(RM) -r "$@";
	$(run_in_place) --no-gui           \
        --eval ' pkg load generate_html; ' \
	$(html_options)                    \
        --eval ' generate_package_html ("$(package)", "$@", options); ';
	$(FIX_PERMISSIONS) "$@";

clean-unpacked-release:
	@echo "## Cleaning unpacked release tarballs (package + html)..."
	-$(RM) -r $(release_dir) $(html_dir)
	@echo

##
## Recipes for installing the package.
##

.PHONY: install clean-install

octave_install_commands = \
' llist_path = pkg ("local_list"); \
  mkdir ("$(installation_dir)"); \
  load (llist_path); \
  local_packages(cellfun (@ (x) strcmp ("$(package)", x.name), local_packages)) = []; \
  save ("$(package_list)", "local_packages"); \
  pkg ("local_list", "$(package_list)"); \
  pkg ("prefix", "$(installation_dir)", "$(installation_dir)"); \
  pkg ("install", "-local", "-verbose", "$(release_tarball)"); '

## Install unconditionally. Maybe useful for testing installation with
## different versions of Octave.
install: $(release_tarball)
	@echo "Installing package under $(installation_dir) ..."
	$(OCTAVE) --no-gui --eval $(octave_install_commands)
	touch $(install_stamp)

## Install only if installation (under target/...) is not current.
$(install_stamp): $(release_tarball)
	@echo "Installing package under $(installation_dir) ..."
	$(OCTAVE) --no-gui --eval $(octave_install_commands)
	touch $(install_stamp)

clean-install:
	@echo "## Cleaning installation under $(installation_dir) ..."
	-$(RM) -r $(installation_dir)
	@echo


##
## Recipes for testing purposes
##

.PHONY: run doctest check

## Start an Octave session with the package directories on the path for
## interactice test of development sources.
run: $(install_stamp)
	$(run_in_place) --no-gui --persist

rungui: $(install_stamp)
	$(run_in_place) --gui --persist

## Test example blocks in the documentation.  Needs doctest package
##  https://octave.sourceforge.io/doctest/index.html
doctest: $(install_stamp)
	$(run_in_place) --no-gui --eval 'pkg load doctest;' \
          --eval "pkgs = pkg('list', '$(package)');" \
          --eval "target = {pkgs{1}.dir};" \
	  --eval "doctest (target);"


## Test package.
octave_test_commands = \
' pkgs = pkg("list", "$(package)"); \
  dirs = {pkgs{1}.dir}; \
  __run_test_suite__ (dirs, {}); '

## the following works, too, but provides no overall summary output as
## __run_test_suite__ does:
##
##    else cellfun (@runtests, horzcat (cellfun (@ (dir) ostrsplit (([~, dirs] = system (sprintf ("find %s -type d", dir))), "\n\r", true), dirs, "UniformOutput", false){:})); endif '
check: $(install_stamp)
	$(run_in_place) --no-gui --eval $(octave_test_commands)

## 
## Docs
##
.PHONY: docs
docs: doc/$(packageprefix)$(package).pdf doc/$(packageprefix)$(package).html doc/$(packageprefix)$(package).qhc

clean-docs:
	$(RM) -f doc/$(packageprefix)$(package).info
	$(RM) -f doc/$(packageprefix)$(package).pdf
	$(RM) -f doc/$(packageprefix)$(package).html
	$(RM) -f doc/functions.texi
	$(RM) -f doc/version.texi
	$(RM) -f doc/$(packageprefix)$(package).qhc doc/$(packageprefix)$(package).qch

doc/version.texi: $(release_dir_dep)
	@echo Generating $@
	@echo "@c autogenerated from Makefile" > $@
	@echo "@set VERSION $(version)" >> $@
	@echo "@set PACKAGE $(package)" >> $@
	@echo "@set DATE $(pkg_date)" >> $@

doc/$(packageprefix)$(package).pdf: doc/$(packageprefix)$(package).texi doc/functions.texi doc/version.texi
	cd doc && SOURCE_DATE_EPOCH=$(REPO_TIMESTAMP) $(TEXI2PDF) $(packageprefix)$(package).texi
	# remove temp files
	cd doc && $(RM) -f $(packageprefix)$(package).aux  $(packageprefix)$(package).cp  $(packageprefix)$(package).cps  $(packageprefix)$(package).fn  $(packageprefix)$(package).fns  $(packageprefix)$(package).log  $(packageprefix)$(package).toc

doc/$(packageprefix)$(package).html: doc/$(packageprefix)$(package).texi doc/functions.texi doc/version.texi
	cd doc && SOURCE_DATE_EPOCH=$(REPO_TIMESTAMP) $(MAKEINFO) --html --css-ref=$(packageprefix)$(package).css  $(MAKEINFO_HTML_OPTIONS) --output=$(packageprefix)${package}.html $(packageprefix)$(package).texi

doc/functions.texi: $(release_dir_dep)
	cd doc && ./mkfuncdocs.py --src-dir=../inst/ ../INDEX | $(SED) 's/@seealso/@xseealso/g' > functions.texi

doc/$(packageprefix)$(package).qhc: doc/$(packageprefix)$(package).html
	# try also create qch file if can
	cd doc && ./mkqhcp.py $(packageprefix)$(package) && $(QHELPGENERATOR) $(packageprefix)$(package).qhcp -o $(packageprefix)$(package).qhc
	cd doc && $(RM) $(packageprefix)$(package).qhcp $(packageprefix)$(package).qhp
##
## CLEAN
##

.PHONY: clean

clean: clean-tarballs clean-unpacked-release clean-install clean-docs clean-runinplace
	test -e inst/test && rmdir inst/test || true
	test -e $(target_dir)/fntests.log && rm -f $(target_dir)/fntests.log || true
	@echo "## Removing target directory (if empty)..."
	test -e $(target_dir) && rmdir $(target_dir) || true
	@echo
	@echo "## Cleaning done"
	@echo

## no install run
## Remove if not needed, most packages do not have PKG_ADD directives.
CC_SOURCES  := $(wildcard src/*.cc)
PKG_ADD     := $(shell $(GREP) -sPho '(?<=(//|\#\#) PKG_ADD: ).*' \
                         $(CC_SOURCES))

src/Makefile: src/Makefile.in
ifneq (,$(wildcard $(TOPDIR)/src/bootstrap))
	cd "$(TOPDIR)/src" && ./bootstrap && $(RM) -r "autom4te.cache"
endif
ifneq (,$(wildcard $(TOPDIR)/src/configure))
	cd "$(TOPDIR)/src" && ./configure
endif

ifneq (,$(wildcard $(TOPDIR)/src/Makefile.in))
compile-inplace: src/Makefile
	$(MAKE) -C src
else
compile-inplace:
	# nothing to do ?
endif


runinplace: compile-inplace
	$(OCTAVE) --no-gui --silent --persist --path "$(TOPDIR)/inst/" --path "$(TOPDIR)/src/" \
	  --eval '$(PKG_ADD)'

clean-runinplace:
ifneq (,$(wildcard $(TOPDIR)/src/Makefile))
	$(MAKE) -C src clean
endif


