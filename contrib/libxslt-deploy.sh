base="$(dirname $0)"
source $base/libxslt-source

wget -nc -O"/tmp/$LIBXSLTPKG" "$LIBXSLTURI"

LIBXSLTDIR=$(basename $LIBXSLTPKG .zip)
rm -rf /tmp/$LIBXSLTDIR
$base/7za.exe x -o/tmp/ "/tmp/$LIBXSLTPKG" -xr!readme.txt

cp -rf /tmp/$LIBXSLTDIR/* /
rm -rf /tmp/$LIBXSLTDIR
