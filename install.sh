base="$(dirname $0)"
source $base/msysgit-source
source $base/cmake-source

echo Installing Prereqs...
mingw-get install base \
	msys-base msys-wget mingw-dtk \
	autoconf automake libtool \
	base gcc-core gcc-g++

echo Downloading files...
wget -nc -O"/tmp/$GITPKG" "$GITURI"
echo $GITSHA *"/tmp/$GITPKG" | sha1sum -c
if [ $? -ne 0 ]; then
	echo ERROR: MsysGit package integrity could not be verified.
	rm -f "/tmp/$GITPKG"
	exit 1
fi
wget -nc -O"/tmp/$CMAKEPKG" "$CMAKEURI"

echo Deploying files...
$base/7za x -o/ "/tmp/$GITPKG" -ir@$base/msysgit-unpack -y

CMAKEDIR=$(basename $CMAKEPKG .zip)
rm -rf /tmp/$CMAKEDIR
$base/7za x -o/tmp/ "/tmp/$CMAKEPKG"
cp -rf /tmp/$CMAKEDIR/* /
rm -rf $CMAKEDIR
cp -f $base/profile /etc/profile
cp -f $base/vimrc /share/vim/vimrc

echo Reloading profile...
source /etc/profile

echo Done!
