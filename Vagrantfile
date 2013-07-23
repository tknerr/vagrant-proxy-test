# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
    
  config.vm.box = "opscode_ubuntu-13.04_provisionerless"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-13.04_provisionerless.box"
  
  config.vm.provision :shell, :inline => <<-EOF
  export FOO=BAR
  echo 'echo foo is \$FOO and param \$1' > ./foo.sh
  chmod +x ./foo.sh
  ./foo.sh p1
  cat ./foo.sh | sudo -E bash -s -- p2
  EOF

  #config.vm.network :private_network, ip: "33.33.40.20"

end