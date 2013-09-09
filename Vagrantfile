# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "apt-mirror-berkshelf"
  config.vm.box = "devfort-ubuntu-13.04-provisionerless-120gb"
  config.vm.box_url = "http://devfort.s3.amazonaws.com/boxes/devfort-ubuntu-13.04-provisionerless-120gb-virtualbox.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'apt_mirror' => {
        'data_dir' => '/home/vagrant/apt',
        'user' => 'vagrant'
      }
    }

    chef.run_list = [
        "recipe[apt-mirror::default]",
    ]
  end
end
