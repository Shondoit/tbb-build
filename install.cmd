@ECHO OFF
SET base=%~dp0
SET base="%base:~0,-1%"

ECHO.Deploying TBB-Build

MKDIR %base%\bin 2> NUL
MKDIR %base%\libexec\mingw-get 2> NUL
MKDIR %base%\var\lib\mingw-get\data 2> NUL

COPY /Y %base%\contrib\mingw-get.exe %base%\bin\mingw-get.exe
COPY /Y %base%\contrib\mingw-lastrites.exe %base%\libexec\mingw-get\lastrites.exe
COPY /Y %base%\contrib\mingw-get-0.dll %base%\libexec\mingw-get\mingw-get-0.dll
COPY /Y %base%\contrib\mingw-default.xml %base%\var\lib\mingw-get\data\profile.xml

%base%\bin\mingw-get.exe install ^
	mingw-get base msys-base msys-wget mingw-dtk ^
	msys-man autoconf automake libtool gcc-core gcc-g++

SET PATH=%PATH%;%~dp0msys\1.0\bin
%base%\msys\1.0\bin\bash.exe %base%\contrib\msysgit-deploy.sh
%base%\msys\1.0\bin\bash.exe %base%\contrib\asciidoc-deploy.sh
%base%\msys\1.0\bin\bash.exe %base%\contrib\docbook-deploy.sh
%base%\msys\1.0\bin\bash.exe %base%\contrib\libxml2-deploy.sh
%base%\msys\1.0\bin\bash.exe %base%\contrib\libxslt-deploy.sh
%base%\msys\1.0\bin\bash.exe %base%\contrib\libiconv-deploy.sh
%base%\msys\1.0\bin\bash.exe %base%\contrib\zlib-deploy.sh
%base%\msys\1.0\bin\bash.exe %base%\contrib\cmake-deploy.sh

COPY /Y %base%\contrib\profile %base%\msys\1.0\etc\profile
COPY /Y %base%\contrib\vimrc %base%\msys\1.0\share\vim\vimrc

COPY /Y %base%\contrib\mingw-start.cmd %base%\start.cmd

ECHO.
ECHO.Done!
ECHO.
PAUSE
