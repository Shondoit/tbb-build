base="$(dirname $0)"
source $base/libiconv-source

wget -nc -O"/tmp/$LIBICONVPKG" "$LIBICONVURI"

LIBICONVDIR=$(basename $LIBICONVPKG .zip)
rm -rf /tmp/$LIBICONVDIR
$base/7za.exe x -o/tmp/ "/tmp/$LIBICONVPKG"

cp -rf /tmp/$LIBICONVDIR/* /
rm -rf /tmp/$LIBICONVDIR
