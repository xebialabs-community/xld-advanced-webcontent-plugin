#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#
from java.lang import System

if deployed.virtualHost is None or deployed.virtualHost.documentRoot is None:
	documentRoot = deployed.container.defaultDocumentRoot
else:
	documentRoot = deployed.virtualHost.documentRoot

timestamp = System.currentTimeMillis()
deployed.targetDirectory = ("%s/%s-%s" % (documentRoot, version, timestamp))

logger.debug("%s: updated the targetDirectory to %s" % (deployed.id, deployed.targetDirectory) )