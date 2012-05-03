base="$(dirname $0)"
VER=`cat $base/version`
OUTPUT=$base/release/tbb-build-$VER.zip

mkdir -p $base/release
rm -f $OUTPUT
$base/7za a $OUTPUT \
	$base/install.sh \
	$base/upgrade.sh \
	$base/7za.exe \
	$base/7za-license.txt \
	$base/msysgit-unpack \
	$base/profile \
	$base/sources \
	$base/vimrc
