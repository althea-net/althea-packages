Althea Packages
===================

This repo contains a package feed for the Althea Firmware repo

To create a new package

1. Copy an existing makefile as a template
2. Edit it to match the build properties of the target package
3. Make a release on github or get a master tarball in some other fashion
4. make sure that tarball is named correctly package-name-version.tar.gz and the
   folder tarred inside must be named exactly the same.
5. Update the feeds in your LEDE directory and build again to build the new
   package in parallel to the program
