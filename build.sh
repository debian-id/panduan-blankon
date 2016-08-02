#!/bin/bash
#
# Buku Panduan BlankOn Builder
#
# pandoc 1.12.4.2
# Compiled with texmath 0.6.6.1, highlighting-kate 0.5.8.5.
#
THEME='blankon-template-ccbysa.tex'
#THEME='blankon.tex'
VERSION='1.0'
DOC='buku-panduan'
RILIS='rote'
TARGET='output'
BROWSER='firefox'
LOKASI='content'

echo "Menghapus berkas sebelumnya"
rm $DOC-$RILIS.html
rm -rf $TARGET/*
mkdir -p $TARGET/

echo "Membuat berkas text"
# text
pandoc \
-o $TARGET/$DOC-$RILIS.txt $LOKASI/*md

echo "Membuat berkas html"
# HTML
pandoc \
-o $DOC-$RILIS.html $LOKASI/*md

echo "Membuat berkas pdf normal"
# PDF Normal
pandoc \
--template $THEME \
--variable version=$VERSION \
-V documentclass=book \
-V links-as-notes \
--toc -N \
-o $TARGET/$DOC-$RILIS.pdf $LOKASI/*md

echo "Membuat berkas pdf hitam putih"
# PDF Black & White
pandoc \
--template $THEME \
--variable version=$VERSION \
-V documentclass=book \
-V links-as-notes \
-V urlcolor=black \
-V linkcolor=black \
--no-highlight \
--toc -N \
-o $TARGET/$DOC-$RILIS-bw.pdf $LOKASI/*md

echo "Membuat berkas odt"
# Word
pandoc \
--variable version=$VERSION \
-V documentclass=book \
-V links-as-notes \
--toc -N \
-o $TARGET/$DOC-$RILIS.odt $LOKASI/*md

#echo "Membuka berkas html"
#$BROWSER $TARGET/$RILIS/$DOC-$RILIS.html
echo "Selesai"

