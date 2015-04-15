# Preface #

This document describes the functionality provided by the Advanced WebContent plugin.

See the **XL Deploy Reference Manual** for background information on XL Deploy and deployment concepts.

# Overview #

The Advanced WebContent plugin is a XL Deploy plugin that extends the standard WebServer plugin with two WebContent CIs:
	* LargeWebContent. A replacement of www.WebContent for large webcontent deployments. This CI copies the content to the target nodes as a single
	archive, rather than as individual files. For deployments containing a large number (>10.000) of files this can speed up deployment considerably: to seconds instead of multiple minutes.  
	* VersionedWebContent. Enables a rolling upgrade of WebContent by deploying to a versioned subfolder and setting up symlinks 'next' and 'current'.

# Requirements #

* **Requirements**
	* **XL Deploy** 4.5.0
	* **XL Plugins**
		* Web Server Plugin
	* target nodes should run a UNIX like OS. Windows is not supported.

# Installation #

Place the plugin JAR file into your `SERVER_HOME/plugins` directory.   Make sure you have additional runtime libraries mentioned in the requirements section also installed in the correct directory.

# Usage #

