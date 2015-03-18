# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "ubuntu/trusty64"

  config.vm.network 'private_network', ip: "10.11.12.13"

  config.vm.synced_folder '.', '/vagrant'
  
  config.vm.provision "docker"

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'vagrant-dev'
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end
  
  config.vm.provision "shell", path: "provision.sh"

end
