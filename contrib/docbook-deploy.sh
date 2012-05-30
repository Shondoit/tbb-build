base="$(dirname $0)"
source $base/docbook-source

wget -nc -O"/tmp/$DOCBOOKPKG" "$DOCBOOKURI"
$base/7za.exe x -o/etc/xml/ "/tmp/$DOCBOOKPKG" -y
