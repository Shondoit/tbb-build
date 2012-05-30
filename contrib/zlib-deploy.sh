base="$(dirname $0)"
source $base/zlib-source

wget -nc -O"/tmp/$ZLIBPKG" "$ZLIBURI"

ZLIBDIR=$(basename $ZLIBPKG .win32.zip)
rm -rf /tmp/$ZLIBDIR
$base/7za.exe x -o/tmp/ "/tmp/$ZLIBPKG"

cp -rf /tmp/$ZLIBDIR/* /
rm -rf /tmp/$ZLIBDIR
