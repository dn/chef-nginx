# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "nginx-berkshelf"
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  config.vm.network :private_network, ip: "33.33.33.10"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.vm.provision :chef_solo do |chef|
    chef.json = {
        'app' => { 'name' => 'rack_based_service' }
    }
    chef.run_list = [
      "recipe[apt::default]",
      "recipe[monit::default]",
      "recipe[monit::mmonit]",
      "recipe[nginx::default]",
      "recipe[nginx::service]"
    ]
  end
end


