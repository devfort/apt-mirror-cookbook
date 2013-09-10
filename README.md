Description
===========

This cookbook configures the machine as a mirror of apt.

Requirements
============

Platform
--------

* Ubuntu 13.04 (that's all we support at /dev/fort for now, so that's all I've tested.)

Attributes
==========

Cookbook attributes are named under the `apt_mirror` namespace.

* `node['apt_mirror']['user']` - user to host apt mirror as, defaults to `fort`
* `node['apt_mirror']['data_dir']` - directory to store apt mirror in, defaults to '/data/apt'
* `default['apt_mirror']['remote_apt']` - URL for the remote apt instance to mirror, defaults to `http://archive.ubuntu.com/ubuntu`
* `default['apt_mirror']['release']` - [release codename](https://wiki.ubuntu.com/DevelopmentCodeNames) to mirror packages for, defaults to `raring` (for 13.04)
* `default['apt_mirror']['architecture']` - CPU architecture to mirror packages for, defaults to `amd64`. If unset, uses the host architecture.

* `node['apt_mirror']['apache']['listen_hostname']` - Hostname to listen on for apt Apache virtualhost, defaults to '*'
* `node['apt_mirror']['apache']['listen_port']` - Port to listen on for apt Apache virtualhost, defaults to '80'

Recipes
=======

The main entrypoint for this cookbook is the `default` recipe.

Usage
=====

Include `apt-mirror` and it will start replicating http://archive.ubuntu.com/ubuntu. This will take a _very_ long time (probably a couple of days), and require tens of gigabytes of storage (~60GB, at time of writing). You have been warned.

You can keep an eye on the mirroring progress by running `tail`ing `/var/log/upstart/apt-mirror.log`.

TODO
====

- `client` recipe
