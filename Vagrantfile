# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
    
  config.vm.box = "opscode_ubuntu-13.04_provisionerless"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
  
  # configure proxy on the Vagrant VM
  if ENV['VAGRANT_HTTP_PROXY']
    config.vm.provision :shell, :path => 'set_proxy.sh', :args => ENV['VAGRANT_HTTP_PROXY']
  end

  # install omnibus via shell provisioner because vagrant-omnibus does not work behind a proxy yet
  config.vm.provision :shell, :inline => "cat /tmp/foo.sh | sudo -E bash -s -- 'from_vagrantfile'"
  #config.vm.provision :shell, :inline => "wget -qO- https://www.opscode.com/chef/install.sh | sudo -E bash -s -- -v 11.4.4-2"

end