# Makefile.in --
#
#	This file is a Makefile for Sample TEA Extension.  If it has the name
#	"Makefile.in" then it is a template for a Makefile;  to generate the
#	actual Makefile, run "./configure", which is a configuration script
#	generated by the "autoconf" program (constructs like "@foo@" will get
#	replaced in the actual Makefile.
#
# Copyright (c) 1999 Scriptics Corporation.
#
# See the file "license.terms" for information on usage and redistribution
# of this file, and for a DISCLAIMER OF ALL WARRANTIES.
#
# RCS: @(#) $Id: Makefile.in,v 1.1.1.11 2003/08/16 15:59:17 marco Exp marco $

#========================================================================
# Edit the following few lines when writing a new extension
#========================================================================

#========================================================================
# Enumerate the names of the source files included in this package.
# This will be used when a dist target is added to the Makefile.
# EXTRA_SOURCES will be replaced by WIN_SOURCES or UNIX_SOURCES, as is
# appropriate for your platform.  It is not important to specify the
# directory, as long as it is the $(srcdir) or in the generic, win or
# unix subdirectory.
#========================================================================

tksquare_SOURCES	= init.c tkSquare.c $(UNIX_SOURCES)

WIN_SOURCES	= 
UNIX_SOURCES	= 

#========================================================================
# Identify the object files.  This replaces .c with .$(OBJEXT) for all
# the named source files.   These objects are created and linked into the
# final library.  In these do not correspond directly to the source files
# above, you will need to enumerate the object files here.
# Normally we would use $(OBJEXT), but certain make executables won't do
# the extra macro in a macro conversion properly.
#
# "tksquare_LIB_FILE" refers to the library (dynamic or static as per
# configuration options) composed of the named objects.
#========================================================================

tksquare_OBJECTS	= $(tksquare_SOURCES:.c=.o)
tksquare_LIB_FILE	= libtksquare0.1.0.so

#========================================================================
# RUNTIME_SOURCES identifies Tcl runtime files that are associated with
# this package that need to be installed, if any.
#========================================================================

RUNTIME_SOURCES	= tkSquare.tcl

PKG_MAN_PAGES	= $(top_builddir)/doc/tkSquare.n

#========================================================================
# This is a list of header files to be installed
#========================================================================

GENERIC_HDRS	= $(srcdir)/generic/tkTable.h

#========================================================================
# Add additional lines to handle any additional AC_SUBST cases that
# have been added to the configure script.
#========================================================================

PKG_EXTRA_FILES = license.terms README* DESCRIPTION.*

#========================================================================
# Nothing of the variables below this line need to be changed.  Please
# check the TARGETS section below to make sure the make targets are
# correct.
#========================================================================

#========================================================================
# The variable "$(PACKAGE)_LIB_FILE" is the parameterized name of the
# library that we are building.
#========================================================================

lib_BINARIES	= $($(PACKAGE)_LIB_FILE)
BINARIES	= $(lib_BINARIES)

SHELL		= /bin/sh

srcdir		= .
prefix		= /usr/local
exec_prefix	= /usr/local

bindir		= /usr/local/bin
libdir		= /usr/local/lib
datadir		= /usr/local/share
mandir		= /usr/local/man
includedir	= /usr/local/include

DESTDIR		=

PKG_DIR		= $(PACKAGE)$(VERSION)
pkgdatadir	= $(datadir)/$(PKG_DIR)
pkglibdir	= $(libdir)/$(PKG_DIR)
pkgincludedir	= $(includedir)/$(PKG_DIR)

top_builddir	= .

INSTALL		= /usr/bin/install -c
INSTALL_PROGRAM	= ${INSTALL}
INSTALL_DATA	= ${INSTALL} -m 644
INSTALL_SCRIPT	= ${INSTALL}

PACKAGE		= tksquare
VERSION		= 0.1.0
CC		= gcc -pipe
CFLAGS_DEBUG	= -g
CFLAGS_DEFAULT	= $(CFLAGS_OPTIMIZE)
CFLAGS_OPTIMIZE	= -O -D__NO_STRING_INLINES -D__NO_MATH_INLINES
CLEANFILES	= pkgIndex.tcl tkSquare.tcl
EXEEXT		= 
LDFLAGS_DEBUG	= 
LDFLAGS_DEFAULT	= $(LDFLAGS_OPTIMIZE)
LDFLAGS_OPTIMIZE = 
MAKE_LIB	= ${SHLIB_LD} -o $@ $($(PACKAGE)_OBJECTS) ${SHLIB_LDFLAGS} ${SHLIB_LD_LIBS} 
MAKE_SHARED_LIB	= ${SHLIB_LD} -o $@ $($(PACKAGE)_OBJECTS) ${SHLIB_LDFLAGS} ${SHLIB_LD_LIBS}
MAKE_STATIC_LIB	= ${STLIB_LD} $@ $($(PACKAGE)_OBJECTS)
OBJEXT		= o
RANLIB		= :
SHLIB_CFLAGS	= -fPIC
SHLIB_LD	= gcc -pipe -shared
SHLIB_LDFLAGS	= $(LDFLAGS_DEFAULT)
SHLIB_LD_LIBS	= ${LIBS} -L/usr/local/lib -ltclstub8.4 -L/usr/local/lib -ltkstub8.4
STLIB_LD	= ${AR} cr
TCL_DEFS	=  -DPEEK_XCLOSEIM=1 -D_LARGEFILE64_SOURCE=1 -DTCL_WIDE_INT_TYPE=long\ long -DHAVE_STRUCT_STAT64=1 -DHAVE_TYPE_OFF64_T=1 -DHAVE_GETCWD=1 -DHAVE_OPENDIR=1 -DHAVE_STRSTR=1 -DHAVE_STRTOL=1 -DHAVE_STRTOLL=1 -DHAVE_STRTOULL=1 -DHAVE_TMPNAM=1 -DHAVE_WAITPID=1 -DHAVE_LIMITS_H=1 -DHAVE_UNISTD_H=1 -DHAVE_SYS_PARAM_H=1 -DUSE_TERMIOS=1 -DHAVE_SYS_TIME_H=1 -DTIME_WITH_SYS_TIME=1 -DHAVE_TM_ZONE=1 -DHAVE_GMTIME_R=1 -DHAVE_LOCALTIME_R=1 -DHAVE_TM_GMTOFF=1 -DHAVE_TIMEZONE_VAR=1 -DHAVE_ST_BLKSIZE=1 -DSTDC_HEADERS=1 -DHAVE_SIGNED_CHAR=1 -DHAVE_LANGINFO=1 -DHAVE_SYS_IOCTL_H=1 
TCL_SRC_DIR	= /home/azzurra/local/tmp/tcl/tcl8.4.8
TCL_BIN_DIR	= /usr/local/lib
TK_SRC_DIR	= /home/azzurra/local/tmp/tcl/tk8.4.8
TK_BIN_DIR	= /usr/local/lib

# Not used by sample, but retained for reference of what Tcl required
TCL_LIBS	= -ldl  -lieee -lm
TK_LIBS		= -L/usr/X11R6/lib -lX11 -ldl  -lieee -lm

TK_TOP_DIR_NATIVE = @TK_TOP_DIR_NATIVE@
TCL_TOP_DIR_NATIVE = @TCL_TOP_DIR_NATIVE@

#========================================================================
# TCLLIBPATH seeds the auto_path in Tcl's init.tcl so we can test our
# package without installing.  The other environment variables allow us
# to test against an uninstalled Tcl.  Add special env vars that you
# require for testing here (like TCLX_LIBRARY).
#========================================================================

EXTRA_PATH	= $(top_builddir):$(TCL_BIN_DIR):$(TK_BIN_DIR)
TCLSH_ENV	= TCL_LIBRARY=`echo $(TCL_SRC_DIR)/library` \
		  TK_LIBRARY=`echo $(TK_SRC_DIR)/library` \
		  LD_LIBRARY_PATH="$(EXTRA_PATH):$(LD_LIBRARY_PATH)" \
		  LIBPATH="$(EXTRA_PATH):${LIBPATH}" \
		  SHLIB_PATH="$(EXTRA_PATH):${SHLIB_PATH}" \
		  PATH="$(EXTRA_PATH):$(PATH)" \
		  TCLLIBPATH="$(top_builddir)"
TCLSH_PROG	= /usr/local/lib/../bin/tclsh8.4
WISH_PROG	= /usr/local/lib/../bin/wish8.4
TCLSH		= $(TCLSH_ENV) $(TCLSH_PROG)
WISH		= $(TCLSH_ENV) $(WISH_PROG)

# The local includes must come first, because the TK_XINCLUDES can be
# just a comment
INCLUDES	= -I. -I"`echo $(srcdir)/generic`" \
		  -I"/usr/local/include" -I"/usr/local/include" 

EXTRA_CFLAGS	= $(MEM_DEBUG_FLAGS) 

DEFS		= $(TCL_DEFS) -DPACKAGE_NAME=\"\" -DPACKAGE_TARNAME=\"\" -DPACKAGE_VERSION=\"\" -DPACKAGE_STRING=\"\" -DPACKAGE_BUGREPORT=\"\" -DVERSION=\"0.1.0\" -DSTDC_HEADERS=1 -DHAVE_SYS_TYPES_H=1 -DHAVE_SYS_STAT_H=1 -DHAVE_STDLIB_H=1 -DHAVE_STRING_H=1 -DHAVE_MEMORY_H=1 -DHAVE_STRINGS_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_STDINT_H=1 -DHAVE_UNISTD_H=1 -DUSE_TCL_STUBS=1 -DUSE_TK_STUBS=1  $(EXTRA_CFLAGS)

CONFIG_CLEAN_FILES = Makefile

CPPFLAGS	= 
LIBS		=  -L/usr/X11R6/lib -lX11
AR		= ar
CFLAGS		=  ${CFLAGS_DEFAULT} ${CFLAGS_WARNING} ${SHLIB_CFLAGS}
COMPILE		= $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)

#========================================================================
# Start of user-definable TARGETS section
#========================================================================

#========================================================================
# TEA TARGETS.  Please note that the "libraries:" target refers to platform
# independent files, and the "binaries:" target inclues executable programs and
# platform-dependent libraries.  Modify these targets so that they install
# the various pieces of your package.  The make and install rules
# for the BINARIES that you specified above have already been done.
#========================================================================

all: binaries libraries doc

#========================================================================
# The binaries target builds executable programs, Windows .dll's, unix
# shared/static libraries, and any other platform-dependent files.
# The list of targets to build for "binaries:" is specified at the top
# of the Makefile, in the "BINARIES" variable.
#========================================================================

binaries: $(BINARIES) pkgIndex.tcl

libraries: $(srcdir)/tkSquare.tcl

$(srcdir)/tkSquare.tcl: $(top_builddir)/library/tkSquare.tcl 
	rm -f $(srcdir)/tkSquare.tcl
	cp $(top_builddir)/library/tkSquare.tcl $(srcdir)/tkSquare.tcl

doc:

install: all install-binaries install-libraries install-doc

install-binaries: binaries install-lib-binaries install-bin-binaries
	@mkdir -p $(DESTDIR)$(pkglibdir)
	$(INSTALL_DATA) pkgIndex.tcl $(DESTDIR)$(pkglibdir)
	$(INSTALL_DATA) $(srcdir)/license.terms $(DESTDIR)$(pkglibdir)
	$(INSTALL_DATA) $(srcdir)/README $(DESTDIR)$(pkglibdir)

#========================================================================
# This rule installs platform-independent files, such as header files.
#========================================================================

install-libraries: libraries

#========================================================================
# Install documentation.  Unix manpages should go in the $(mandir)
# directory.
#========================================================================

install-doc: doc
	@mkdir -p $(DESTDIR)$(pkglibdir)/html
	@list='$(PKG_MAN_PAGES)'; for p in $$list; do \
		html=`basename $$p|sed -e 's/.[^.]*$$//'`.html; \
	  	$(INSTALL_DATA) $(srcdir)/doc/$$html $(DESTDIR)$(pkglibdir)/html/; \
	done

# html:
# 	@cd $(srcdir)/doc; \
# 	list='$(PKG_MAN_PAGES)'; for p in $$list; do \
# 		html=`basename $$p|sed -e 's/.[^.]*$$//'`.html; \
# 		echo "Creating \"$$html\" from \"$$p\""; \
# 		rm -f $$html; \
# 		nroff -man $$p | rman -f HTML > $$html; \
# 	done

# Piping to cat is necessary on Windows to see the output, and
# harmless on Unix
test: binaries libraries
	$(WISH) `echo $(srcdir)/tests/all.tcl` $(TESTFLAGS) | cat

shell: binaries libraries
	@$(WISH) $(SCRIPT)

gdb:
	$(TCLSH_ENV) gdb $(WISH_PROG) $(SCRIPT)

depend:

#========================================================================
# $($(PACKAGE)_LIB_FILE) should be listed as part of the BINARIES variable
# mentioned above.  That will ensure that this target is built when you
# run "make binaries".
#
# The $($(PACKAGE)_OBJECTS) objects are created and linked into the final
# library.  In most cases these object files will correspond to the
# source files above.
#========================================================================

$($(PACKAGE)_LIB_FILE): $($(PACKAGE)_OBJECTS)
	-rm -f $($(PACKAGE)_LIB_FILE)
	${MAKE_LIB}
	$(RANLIB) $($(PACKAGE)_LIB_FILE)

#========================================================================
# We need to enumerate the list of .c to .o lines here.
# Unfortunately, there does not seem to be any other way to do this
# in a Makefile-independent way.
#
# In the following lines, $(srcdir) refers to the toplevel directory
# containing your extension.  If your sources are in a subdirectory,
# you will have to modify the paths to reflect this:
#
# tkpkg.$(OBJEXT): $(srcdir)/src/win/tkpkg.c
# 	$(COMPILE) -c `echo $(srcdir)/generic/tkpkg.c` -o $@
#
# Setting the VPATH variable to a list of paths will cause the 
# makefile to look into these paths when resolving .c to .obj
# dependencies.
#========================================================================

VPATH = $(srcdir)/generic:$(srcdir)/unix:$(srcdir)/win

.SUFFIXES: .c .$(OBJEXT)

.c.$(OBJEXT):
	$(COMPILE) -c `echo $<` -o $@

pkgIndex.tcl:
	(\
	echo 'if {[catch {package require Tcl 8.2}]} return';\
	echo 'package ifneeded $(PACKAGE) $(VERSION) \
	    [list load [file join $$dir $($(PACKAGE)_LIB_FILE)] $(PACKAGE)]';\
	echo 'set ::tksquare_library [file normalize [file dirname [info script]]]'\
	) > pkgIndex.tcl

#========================================================================
# End of user-definable section
#========================================================================

#========================================================================
# Don't modify the file to clean here.  Instead, set the "CLEANFILES"
# variable in configure.ac
#========================================================================

clean:  
	-test -z "$(BINARIES)" || rm -f $(BINARIES)
	-rm -f *.$(OBJEXT) core *.core
	-test -z "$(CLEANFILES)" || rm -f $(CLEANFILES)

distclean: clean
	-rm -f *.tab.c
	-rm -f $(CONFIG_CLEAN_FILES)
	-rm -f config.cache config.log config.status

#========================================================================
# Install binary object libraries.  On Windows this includes both .dll and
# .lib files.  Because the .lib files are not explicitly listed anywhere,
# we need to deduce their existence from the .dll file of the same name.
#
# You should not have to modify this target.
#========================================================================

install-lib-binaries:
	@mkdir -p $(DESTDIR)$(pkglibdir)
	@list='$(lib_BINARIES)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo " $(INSTALL_PROGRAM) $$p $(DESTDIR)$(pkglibdir)/$$p"; \
	    $(INSTALL_PROGRAM) $$p $(DESTDIR)$(pkglibdir)/$$p; \
	    echo " $(RANLIB) $(DESTDIR)$(pkglibdir)/$$p"; \
	    $(RANLIB) $(DESTDIR)$(pkglibdir)/$$p; \
	    ext=`echo $$p|sed -e "s/.*\.//"`; \
	    if test "x$$ext" = "xdll"; then \
		lib=`basename $$p|sed -e 's/.[^.]*$$//'`.lib; \
		if test -f $$lib; then \
		    echo " $(INSTALL_DATA) $$lib $(DESTDIR)$(pkglibdir)/$$lib"; \
	            $(INSTALL_DATA) $$lib $(DESTDIR)$(pkglibdir)/$$lib; \
		fi; \
	    fi; \
	  fi; \
	done
	@list='$(RUNTIME_SOURCES)'; for p in $$list; do \
	  if test -f $(srcdir)/library/$$p; then \
	    echo " Install $$p $(DESTDIR)$(pkglibdir)/$$p"; \
	    $(INSTALL_DATA) $(srcdir)/library/$$p $(DESTDIR)$(pkglibdir)/$$p; \
	  fi; \
	done

#========================================================================
# Install binary executables (e.g. .exe files)
#
# You should not have to modify this target.
#========================================================================

install-bin-binaries:
	@mkdir -p $(DESTDIR)$(bindir)
	@list='$(bin_BINARIES)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo " $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/$$p"; \
	    $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/$$p; \
	  fi; \
	done

Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
	cd $(top_builddir) \
	  && CONFIG_FILES=$@ CONFIG_HEADERS= $(SHELL) ./config.status

uninstall-binaries:
	list='$(BINARIES)'; for p in $$list; do \
	  rm -f $(DESTDIR)$(libdir)/$$p; \
	done

#========================================================================
# Distribution creation
# You should not have to modify this target.
#========================================================================

#COMPRESS	= tar cvf $(PKG_DIR).tar $(PKG_DIR); compress $(PKG_DIR).tar
COMPRESS	= tar zcvf $(PACKAGE)_$(VERSION)_src.tar.gz $(PKG_DIR)
DIST_ROOT	= /tmp/dist
DIST_DIR	= $(DIST_ROOT)/$(PKG_DIR)

dist-clean:
	rm -rf $(DIST_DIR) $(DIST_ROOT)/$(PKG_DIR).tar.*

dist: dist-clean
	mkdir -p $(DIST_DIR)
	cp -p $(srcdir)/README* $(srcdir)/ChangeLog \
		$(srcdir)/Makefile.in $(srcdir)/aclocal.m4 \
		$(srcdir)/configure $(srcdir)/configure.ac \
		$(srcdir)/DESCRIPTION.* $(srcdir)/license.terms \
		$(DIST_DIR)/
	chmod 664 $(DIST_DIR)/Makefile.in $(DIST_DIR)/aclocal.m4
	chmod 775 $(DIST_DIR)/configure $(DIST_DIR)/configure.ac

	mkdir $(DIST_DIR)/tclconfig
	cp $(srcdir)/tclconfig/install-sh $(srcdir)/tclconfig/tcl.m4 \
		$(DIST_DIR)/tclconfig/
	chmod 664 $(DIST_DIR)/tclconfig/tcl.m4
	chmod +x $(DIST_DIR)/tclconfig/install-sh

# 	mkdir $(DIST_DIR)/demos
# 	cp -p $(srcdir)/demos/*.tcl $(srcdir)/demos/*.py \
# 		$(srcdir)/demos/*.gif $(DIST_DIR)/demos/

	mkdir $(DIST_DIR)/doc
	cp -p $(srcdir)/doc/*.n $(srcdir)/doc/*.html $(DIST_DIR)/doc/

	mkdir $(DIST_DIR)/generic
	cp -p $(srcdir)/generic/*.c $(srcdir)/generic/*.h $(DIST_DIR)/generic/

	mkdir $(DIST_DIR)/library
	cp -p $(srcdir)/library/*.tcl $(DIST_DIR)/library/

	mkdir $(DIST_DIR)/tests
	cp -p $(srcdir)/tests/*.tcl $(srcdir)/tests/*.test \
		$(srcdir)/tests/*.in $(DIST_DIR)/tests/

	(cd $(DIST_ROOT); $(COMPRESS);)

.PHONY: all binaries clean depend distclean doc install libraries test

# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
