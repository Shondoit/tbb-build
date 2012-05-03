base="$(dirname $0)"
if [ -f $base/sources ]; then
	source $base/sources
else
	echo ERROR: Source list could not be found. Please verify this package.
	exit 1
fi

echo Installing Prereqs...
mingw-get install base \
	msys-base msys-wget mingw-dtk \
	autoconf automake libtool \
	base gcc-core gcc-g++

echo Downloading MsysGit...
wget -nc -O"/tmp/$GITPKG" "$GITURI"
echo $GITSHA *"/tmp/$GITPKG" | sha1sum -c
if [ $? -ne 0 ]; then
	echo ERROR: MsysGit package integrity could not be verified.
	rm -f "/tmp/$GITPKG"
	exit 1
fi

echo Deploying files...
$base/7za x -o/ "/tmp/$GITPKG" -ir@$base/msysgit-unpack -y
cp -f $base/profile /etc/profile
cp -f $base/vimrc /share/vim/vimrc

echo Reloading profile...
source /etc/profile

echo Done!
