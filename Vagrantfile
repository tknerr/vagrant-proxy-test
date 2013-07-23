# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
    
  config.vm.box = "opscode_ubuntu-13.04_provisionerless"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
  
  # configure proxy on the Vagrant VM
  if ENV['VAGRANT_HTTP_PROXY']
    config.vm.provision :shell, :path => 'set_proxy.sh', :args => ENV['VAGRANT_HTTP_PROXY']
  end


end