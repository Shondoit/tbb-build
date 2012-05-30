base="$(dirname $0)"
source $base/asciidoc-source

wget -nc -O"/tmp/$ASCIIDOCPKG" "$ASCIIDOCURI"

ASCIIDOCDIR=$(basename $ASCIIDOCPKG .zip)
rm -rf /tmp/$ASCIIDOCDIR
$base/7za.exe x -o/tmp/ "/tmp/$ASCIIDOCPKG"

#cd /tmp/$ASCIIDOCDIR
#sed -i -e "s%\$(DESTDIR)/%%g" Makefile.in
#./configure --sysconfdir=/usr/local/etc
#make build install docs

mkdir -p /usr/local/bin/asciidoc/
cp -rf /tmp/$ASCIIDOCDIR/* /usr/local/bin/asciidoc/
rm -rf /tmp/$ASCIIDOCDIR
