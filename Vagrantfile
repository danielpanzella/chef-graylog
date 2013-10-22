# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "graylog2-berkshelf"

    # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "opscode-centos-6.4"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_centos-6.4-i386_provisionerless.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.ssh.max_tries = 40
  config.ssh.timeout   = 120

  config.omnibus.chef_version = '11.4.4' #:latest
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }

    chef.run_list = [
        "recipe[graylog2::default]"
    ]
  end
end
