# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "vagrant"



  # Create a default port mapping which allows access to the default Django
  # webserver port (8000) when `python manage.py runserver 0.0.0.0:8000` is
  # executed.  This command is aliased to `webserver` in the included
  # bootstrap.sh provisioning script.
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 5432, host: 5432
  # Setup our local private ip network!
  config.vm.network "private_network", ip: "192.168.100.2"

  # Synchronized folders:

  # A directory for projects.
  config.vm.synced_folder "dev", "/home/vagrant/dev"
  ##, type: "rsync", rsync__args: ["--verbose", "--archive", "--delete", "-z"]

  # A directory for other code libraries.
  config.vm.synced_folder "lib", "/home/vagrant/lib"
  ##, type: "rsync", rsync__args: ["--verbose", "--archive", "--delete", "-z"]

  # When Vagrant spins up a machine, it will also load your cookbook 
  # dependencies via Berkshelf
  config.berkshelf.enabled = true

  # Set the version of Chef you want to use.  The omnibus plug in will
  # ensure you get the version you want installed as Vagrant spins up 
  # the machine
  config.omnibus.chef_version = '11.14.2'

  # Chef Zero path to chef server objects.  These are things like data bags,
  # roles and environments.  
  config.chef_zero.chef_repo_path = "../djangular-vagrant/"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "1024"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Here is where you tell Vagrant how to configure the machine it is 
  # spinning up.  In this case we are using chef, but you could choose
  # Puppet or some other provisioner.  
  config.vm.provision :chef_client do |chef|
    # Set the name of the node explicitly.  I prefer to have my machine
    # names and node names match
    chef.node_name = config.vm.hostname
    # Tell Vagrant what cookbooks to execute. Usually it is just
    # the default recipe of the cookbook this Vagrantfile is in.
    chef.run_list = [
        "recipe[the_commons::default]"
    ]
  end

  # Enable provisioning with a shell script.
  #config.vm.provision "shell", path: "provisioning/bootstrap.sh",
  #  privileged: false
  
  # Additional provisioners such as Puppet, Chef, Ansible, Salt, and Docker
  # are also available. Please see the documentation for more information
  # about their specific syntax and use:
  #
  #     http://docs.vagrantup.com/v2/provisioning/index.html

  #VAGRANT_JSON = JSON.parse(Pathname(__FILE__).dirname.join('nodes', 'vagrant.json').read)

#  config.vm.provision "chef_solo" do |chef|
#    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
#    chef.roles_path = "roles"
#    chef.data_bags_path = "data_bags"
    #chef.provisioning_path = "/tmp/vagrant-chef"

#    chef.run_list = VAGRANT_JSON.delete('run_list')
#    chef.json = VAGRANT_JSON

#    chef.add_recipe "apache2"
#    chef.add_recipe "postgresql::server"
#    # chef.add_recipe "rabbitmq"
#    chef.add_recipe "nvm"
#    chef.add_recipe "nodejs::nodejs_from_package"
#    chef.add_recipe "python"
#    chef.add_recipe "virtualenvwrapper"
#    chef.add_recipe "zsh"
#    chef.add_recipe "vim"
#    chef.add_recipe "git-flow"
#    chef.node_name = "vagrant1"

#    chef.json = {
#      "apache2" => {
#        "listen_address" => "192.168.100.2"
#      },
#      "postgresql" => {
#        "password" => {
#          "postgres" => "notverysecure"
#        },
#        "config" => {
#          "listen_addresses" => "localhost",
#          "port" => 5432,
#          # "log_statement" => "all"
#          # "log_min_error_statement" => "error"
#        }
#      }
#    }
#  end

end
