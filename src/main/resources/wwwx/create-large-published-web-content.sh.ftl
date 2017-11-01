<#--

    Copyright 2017 XEBIALABS

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

-->
#!/bin/sh

if [ ! -e "${deployed.targetDirectory}" ] ; then
	echo creating target dir ${deployed.targetDirectory}
	install -d "${deployed.targetDirectory}" || exit 1
fi

pushd "${deployed.targetDirectory}" || exit 1

case "${deployed.file.path}" in
*.zip)
	EXTRACT_COMMAND="unzip -o"
	LIST_COMMAND="unzip -Z -1"
	;;
*.tgz|*.tar.gz)
	EXTRACT_COMMAND="tar zxvf"
	LIST_COMMAND="tar ztf"
	;;
*.tbz|*.tar.bz2)
	EXTRACT_COMMAND="tar jxvf"
	LIST_COMMAND="tar jtf"
	;;
*)
	echo unsupported archive format ${deployed.file}
	exit 2
esac

echo extracting archive:
echo $EXTRACT_COMMAND ${deployed.file.path}
$EXTRACT_COMMAND "${deployed.file.path}" || exit 1

echo saving manifest
echo $LIST_COMMAND ${deployed.file.path}
$LIST_COMMAND "${deployed.file.path}" | cut -d / -f 1 | sort -u > ".xldeploy-manifest-${deployed.deployable.name}"

