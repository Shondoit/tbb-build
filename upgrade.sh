echo Updating Packages...
mingw-get update
mingw-get upgrade

"$(dirname $0)/install.sh"
