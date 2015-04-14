#
# THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
# FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.
#
deployed.deploymentSequenceNumber = previousDeployed.deploymentSequenceNumber + 1
repositoryService.update(deployed.id, deployed)
logger.debug("%s: updated the deploymentSequenceNumber to %s" % (deployed.id, deployed.deploymentSequenceNumber) )