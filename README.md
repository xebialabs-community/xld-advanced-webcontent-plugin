# XL Deploy Advanced Webcontent plugin

[![Build Status][xld-advanced-webcontent-plugin-travis-image]][xld-advanced-webcontent-plugin-travis-url]
[![License: MIT][xld-advanced-webcontent-plugin-license-image]][xld-advanced-webcontent-plugin-license-url]
![Github All Releases][xld-advanced-webcontent-plugin-downloads-image]

[xld-advanced-webcontent-plugin-travis-image]: https://travis-ci.org/xebialabs-community/xld-advanced-webcontent-plugin.svg?branch=master
[xld-advanced-webcontent-plugin-travis-url]: https://travis-ci.org/xebialabs-community/xld-advanced-webcontent-plugin
[xld-advanced-webcontent-plugin-license-image]: https://img.shields.io/badge/License-MIT-yellow.svg
[xld-advanced-webcontent-plugin-license-url]: https://opensource.org/licenses/MIT
[xld-advanced-webcontent-plugin-downloads-image]: https://img.shields.io/github/downloads/xebialabs-community/xld-advanced-webcontent-plugin/total.svg


## Preface

This document describes the functionality provided by the Advanced WebContent plugin.

See the [XL Deploy reference manual](https://docs.xebialabs.com/xl-deploy) for background information on XL Deploy and deployment concepts.

## Overview

The Advanced WebContent plugin is a XL Deploy plugin that extends the standard WebServer plugin with two WebContent CIs for faster deployments.
	

## Requirements

* **Requirements**
	* **XL Deploy** 4.5.0
	* **XL Plugins**
		* Web Server Plugin
	* target nodes should run a UNIX like OS. Windows is not supported.

## Installation


* Copy the latest JAR file from the [releases page](https://github.com/xebialabs-community/xld-advanced-webcontent-plugin/releases) into the `XL_DEPLOY_SERVER/plugins` directory.
*  Make sure you have additional runtime libraries mentioned in the requirements section also installed in the correct directory.
* Restart the XL Deploy|Release server.

## Usage

* LargeWebContent. A replacement of www.WebContent for large webcontent deployments. This CI copies the content to the target nodes as a single
	archive, rather than as individual files. For deployments containing a large number (>10.000) of files this can speed up deployment considerably: to seconds instead of multiple minutes.  
* VersionedWebContent. Enables a rolling upgrade of WebContent by deploying to a versioned subfolder and setting up symlinks 'next' and 'current'.
