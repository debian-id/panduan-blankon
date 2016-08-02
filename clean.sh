#!/bin/bash
#
# Buku Panduan BlankOn Builder
# pandoc 1.12.4.2
# Compiled with texmath 0.6.6.1, highlighting-kate 0.5.8.5.
#
DOC='buku-panduan'
RILIS='rote'
TARGET='output'

echo "Menghapus berkas sebelumnya"
rm $DOC-$RILIS.html
rm -rf $TARGET/*
mkdir -p $TARGET/

