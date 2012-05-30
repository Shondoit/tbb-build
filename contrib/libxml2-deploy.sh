base="$(dirname $0)"
source $base/libxml2-source

wget -nc -O"/tmp/$LIBXMLPKG" "$LIBXMLURI"

LIBXMLDIR=$(basename $LIBXMLPKG .zip)
rm -rf /tmp/$LIBXMLDIR
$base/7za.exe x -o/tmp/ "/tmp/$LIBXMLPKG"

cp -rf /tmp/$LIBXMLDIR/* /
rm -rf /tmp/$LIBXMLDIR
