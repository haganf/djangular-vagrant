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

  # These folders are all synchronized to the VM from
  #     "host dir (relative), guest dir (absolute)"
  config.vm "synced_folder" do |sync|

    # A directory for projects.
    config.vm.synced_folder "dev", "/home/vagrant/dev"

    # A directory for other code libraries.
    config.vm.synced_folder "lib", "/home/vagrant/lib"
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
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
end
