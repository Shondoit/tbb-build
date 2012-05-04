base="$(dirname $0)"
source $base/cmake-source

wget -nc -O"/tmp/$CMAKEPKG" "$CMAKEURI"

CMAKEDIR=$(basename $CMAKEPKG .zip)
rm -rf /tmp/$CMAKEDIR
$base/7za.exe x -o/tmp/ "/tmp/$CMAKEPKG"
cp -rf /tmp/$CMAKEDIR/* /
rm -rf $CMAKEDIR
