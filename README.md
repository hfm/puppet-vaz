# puppet-vaz

[![Build Status](https://img.shields.io/travis/hfm/puppet-vaz/master.svg?style=flat-square)](https://travis-ci.org/hfm/puppet-vaz)
[![Puppet Forge](https://img.shields.io/puppetforge/v/hfm/vaz.svg?style=flat-square)](https://forge.puppet.com/hfm/vaz)

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with vaz](#setup)
    * [Setup requirements](#setup-requirements)
1. [Usage - Configuration options and additional functionality](#usage)
    * [Configuring vaz](#configuring-vaz)
    * [Configuring modules from Hiera](#configuring-modules-from-hiera)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Public Classes](#public-classes)
    * [Parameters](#parameters)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)
    * [Running tests](#running-tests)
    * [Testing quickstart](#testing-quickstart)

## Description

The vaz module handles installing, configuring, and running [vaz](https://github.com/pyama86/vaz) for [Veeta](https://veeta.org/).

## Setup

### Setup Requirements

The vaz module requires the following puppet module:

- [puppetlabs-apt](https://forge.puppet.com/puppetlabs/apt): version 2.0 or newer (only Debian-based distributions).

## Usage

### Configuring vaz

To install the vaz server with default parameters, declare the `vaz` class.

```puppet
class { 'vaz':
  service => '<service name>',
  token   => '<token>',
}
```

### Configuring modules from Hiera

```yaml
---
vaz::service: <service name>
vaz::token: <token>
```

## Reference

### Public Classes

- [`vaz`](#vaz): Installs, configures, and running vaz server.

### Parameters

- `service`: Specifies your service name. Data type: String. Default: 'vaz'.
- `token`: Specifies your token. Data type: String. Default: undef.

## Limitations

This module has been tested on:

- RedHat Enterprise Linux 7
- CentOS 7
- Scientific Linux 7
- Debian 8, 9
- Ubuntu 16.04

## Development

### Running tests

The STNS puppet module contains tests for both [rspec-puppet](http://rspec-puppet.com/) (unit tests) and [beaker-rspec](https://github.com/puppetlabs/beaker-rspec) (acceptance tests) to verify functionality. For detailed information on using these tools, please see their respective documentation.

#### Testing quickstart

- Unit tests:

```console
$ bundle install
$ bundle exec rake
```

- Acceptance tests:

```console
# Set your DOCKER_HOST variable
$ eval "$(docker-machine env default)"

# List available beaker nodesets
$ bundle exec rake beaker_nodes
centos7
debian9

# Run beaker acceptance tests
$ BEAKER_set=debian9 bundle exec rake beaker
```
