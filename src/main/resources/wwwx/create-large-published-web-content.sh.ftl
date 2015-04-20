<#--
    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
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

