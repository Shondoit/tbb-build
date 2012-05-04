base="$(dirname $0)"
VER=`cat $base/version`
OUTPUT=$base/release/tbb-build-$VER.zip

mkdir -p $base/release
rm -f $OUTPUT
$base/contrib/7za a $OUTPUT \
	$base/contrib \
	$base/install.cmd \
	$base/README \
	$base/version
