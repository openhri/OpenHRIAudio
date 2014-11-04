#!/usr/bin/make -f
# -*- makefile -*-
# Sample debian/rules that uses debhelper.
# This file was originally written by Joey Hess and Craig Small.
# As a special exception, when this file is copied by dh-make into a
# dh-make output file, you may use that output file without restriction.
# This special exception was added by Craig Small in version 0.37 of dh-make.

# Uncomment this to turn on verbose mode.
#export DH_VERBOSE=1

BUILDDIR = build_dir


# secondly called by launchpad
build:
	dh_testdir
	mkdir $(BUILDDIR);
	cd $(BUILDDIR); cmake -DCMAKE_INSTALL_PREFIX=../debian/tmp/usr ..
	make -C $(BUILDDIR)

# thirdly called by launchpad
binary: binary-indep binary-arch

binary-indep:
	# nothing to be done

binary-arch:
	dh_testdir
	dh_testroot
	dh_clean -k -s
	dh_installdirs -s

	cd $(BUILDDIR); cmake -P cmake_install.cmake
	mkdir debian/tmp/DEBIAN
	dpkg-gencontrol -popenhriaudio2.10
	dpkg --build debian/tmp ..

	dh_install -s

# firstly called by launchpad
clean:
	dh_testdir
	dh_testroot

	rm -f build
	rm -rf $(BUILDDIR)

	dh_clean 

.PHONY: binary binary-arch binary-indep clean
