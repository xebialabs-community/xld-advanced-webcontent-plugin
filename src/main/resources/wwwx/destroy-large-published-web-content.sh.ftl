<#--
    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
-->
#!/bin/sh

pushd ${deployed.targetDirectory} || exit 1

rm -rv $(cat ".xldeploy-manifest-${deployed.deployable.name}-${deployed.deployedApplication.version.name}")
rm .xldeploy-manifest-${deployed.deployable.name}-${deployed.deployedApplication.version.name}
