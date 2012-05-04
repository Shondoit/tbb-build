base="$(dirname $0)"
source $base/msysgit-source

wget -nc -O"/tmp/$GITPKG" "$GITURI"
echo $GITSHA *"/tmp/$GITPKG" | sha1sum -c
if [ $? -ne 0 ]; then
	echo ERROR: MsysGit package integrity could not be verified.
	rm -f "/tmp/$GITPKG"
	exit 1
fi

$base/7za.exe x -o/ "/tmp/$GITPKG" -ir@$base/msysgit-unpack -y
