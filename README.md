# puppet-dotdeb

#### Table of Contents

1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Limitations](#limitations)

## Overview

Install dotdeb repository on Debian based OS :

* Installs required package if needed
* Modifies the /etc/default/locale file content
* Modifies the /etc/locale.gen file content
* Executes locale-gen and locale-update commands

## Required dependencies

* Puppet module : puppetlabs/stdlib >= 4.5.0 < 5.0.0
* Puppet module : puppetlabs/apt >= 2.2.1

## Usage

```
include dotdeb
```

## Reference

* manifests/init.pp : Initiates the module and start the apt script.
* manifests/apt.pp : Adds dotdeb repository, imports related public key and executes apt update.

## Limitations

Tested on Debian 8 using Puppet 3.7.  
Debian 8 required for now.
Puppet >= 3.3 required.