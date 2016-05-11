# puppet-dotdeb

#### Table of Contents

1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Limitations](#limitations)

## Overview

Setup dotdeb repository on Debian OS :

* Creates /etc/apt/sources.list.d/dotdeb.list
* Creates /etc/apt/preferences.d/dotdeb.pref
* Execute apt-update

## Required dependencies

* Puppet module : puppetlabs/apt >= 2.2.2

## Usage

Insert the following line into your puppet manifest.
```
include dotdeb
```
which is equivalent to
```
class { "dotdeb":
	pin => 750
}
```

## Reference

* manifests/init.pp : Initiates the module and start the apt script.
* manifests/apt.pp : Adds dotdeb repository, imports related public key and executes apt update.

## Limitations

Tested on Debian 8 using Puppet 3.7 / 3.8.  
Debian OS only.  
Puppet >= 3.7 required.