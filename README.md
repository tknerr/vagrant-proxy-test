
vagrant-proxy-test
==================

Fiddling around with Proxy settings and Vagrant.


Setting Proxy on the Host
=========================

This is required if your host (i.e. the machnine hosting your Vagrant VMs) is behind a Tools.

Tools like [git](http://git-scm.org/), [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf) or [bindler](https://github.com/fgrehm/bindler) require the proxy to be configured correctly when you run `vagrant up`.

This is as simple as setting both the `HTTP_PROXY` and `HTTPS_PROXY` env vars on the host:
```
$ export HTTP_PROXY=http://my.proxy.org:8080
$ export HTTPS_PROXY=http://my.proxy.org:8080
```

Setting Proxy on the Vagrant VM
===============================

Another story is configuring a proxy on the Vagrant VM. 

For example, your laptop (i.e. host) is running inside your corporate network which requires you to configure a proxy, but the Vagrant VM might be running in the AWS Cloud via the [vagrant-aws](https://github.com/mitchellh/vagrant-aws) provider and thus not require a proxy. On the other hand it might be running locally using the default virtualbox provider and then you need the same proxy settings.  

To configure the Vagrant VM for using a proxy via [vagrant-proxyconf](https://github.com/tmatilai/vagrant-proxyconf/) set the `VAGRANT_ENV_HTTP_PROXY` env vars on the host:
```
$ export VAGRANT_ENV_HTTP_PROXY=http://my.proxy.org:8080
$ export VAGRANT_ENV_HTTPS_PROXY=http://my.proxy.org:8080
```

The [vagrant-proxyconf](https://github.com/tmatilai/vagrant-proxyconf/) plugin will pick up this env var and - depending on whether it is set or not - set/unset the proxy *inside* the Vagrant VM via before provisioning.



