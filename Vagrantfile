# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "djangular-vagrant"

  # Create a default port mapping which allows access to the default Django
  # webserver port (8000) when `python manage.py runserver 0.0.0.0:8000` is
  # executed.  This command is aliased to `webserver` in the included
  # bootstrap.sh provisioning script.
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  config.vm.network "forwarded_port", guest: 5432, host: 5432

  config.vm.network "private_network", ip: "192.168.100.2"

  # Synchronized folders:

  # A directory for projects.
  config.vm.synced_folder "dev", "/home/vagrant/dev", type: "rsync", rsync__args: ["--verbose", "--archive", "--delete", "-z"]

  # A directory for other code libraries.
  config.vm.synced_folder "lib", "/home/vagrant/lib", type: "rsync", rsync__args: ["--verbose", "--archive", "--delete", "-z"]

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

  # Enable provisioning with a shell script.
  config.vm.provision "shell", path: "provisioning/bootstrap.sh",
    privileged: false
  
  # Additional provisioners such as Puppet, Chef, Ansible, Salt, and Docker
  # are also available. Please see the documentation for more information
  # about their specific syntax and use:
  #
  #     http://docs.vagrantup.com/v2/provisioning/index.html

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "apache2"
    chef.add_recipe "postgresql::server"
    # chef.add_recipe "rabbitmq"
    chef.add_recipe "nvm"
    chef.add_recipe "nodejs::nodejs_from_package"
    chef.add_recipe "python"
    chef.add_recipe "virtualenvwrapper"
    chef.add_recipe "zsh"
    chef.add_recipe "vim"
    chef.node_name = "vagrant1"

    chef.json = {
      "apache2" => {
        "listen_address" => "192.168.100.2"
      },
      "postgresql" => {
        "password" => {
          "postgres" => "notverysecure"
        },
        "config" => {
          "listen_addresses" => "localhost",
          "port" => 5432,
          # "log_statement" => "all"
          # "log_min_error_statement" => "error"
        }
      }
    }
  end

end
