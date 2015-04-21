#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#
from java.lang import System

timestamp = System.currentTimeMillis()

for _delta in deltas.deltas:
	if _delta.operation == "CREATE" or _delta.operation == "MODIFY":
		deployed = _delta.deployedOrPrevious
		if deployed.type == "wwwx.VersionedPublishedWebContent":
			if deployed.virtualHost is None or deployed.virtualHost.documentRoot is None:
				documentRoot = deployed.container.defaultDocumentRoot
			else:
				documentRoot = deployed.virtualHost.documentRoot

			deployed.targetDirectory = ("%s/%s-%s" % (documentRoot, deployedApplication.version.name, timestamp))

			logger.debug("%s: updated the targetDirectory to %s" % (deployed.id, deployed.targetDirectory) )