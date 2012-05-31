base="$(dirname $0)"
source $base/nsis-source

wget -nc -O"/tmp/$NSISPKG" "$NSISURI"

NSISDIR=$(basename $NSISPKG .zip)
rm -rf /tmp/$NSISDIR
$base/7za.exe x -o/tmp/ "/tmp/$NSISPKG"

mkdir -p /usr/local/bin/nsis/
cp -rf /tmp/$NSISDIR/* /usr/local/bin/nsis/
rm -rf /tmp/$NSISDIR
