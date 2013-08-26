# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
    
  config.vm.box = "opscode_ubuntu-13.04_provisionerless"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"

  config.env_proxy.http = "127.0.0.1:8080"
  config.env_proxy.https = "127.0.0.1:8080"

  config.vm.provision :shell, :inline => 'echo proxy is $http_proxy'

end