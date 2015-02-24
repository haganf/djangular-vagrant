#!/usr/bin/env bash

# Always make sure we have the most up-to-date packages before installing
# anything.
sudo apt-get update

# Install system packages.
sudo apt-get install -y apache2 git python2.7-dev libpq-dev

# TODO: Create an Apache config template and move it to the correct place.
#     This template should contain routing for static and media directories
#     managed by a project within /home/vagrant/dev.  Please document it
#     thoroughly so students don't have to learn Apache from the ground up
#     just to get started on a project.

# If pip is not on PATH, reinstall it.
if command -v pip >/dev/null 2>&1; then
    echo "Skipping pip -- already installed.";
else
    # http://pip.readthedocs.org/
    echo "Installing pip.";
    curl -s https://bootstrap.pypa.io/get-pip.py | sudo /usr/bin/python
fi  

# Install pip packages.
echo "Installing pip requirements from provisioning/requirements.txt.";
sudo -H /usr/local/bin/pip install -r /vagrant/provisioning/requirements.txt

# If nvm is not on PATH, reinstall it.
if [ -f /home/vagrant/.nvm/nvm.sh ]; then
    echo "Skipping nvm -- already installed.";
    echo "If you are having trouble with nvm, try reinstalling as vagrant.";
else
    echo "Installing Node Version Manager.";
    # https://github.com/creationix/nvm/tree/v0.23.3#install-script
    curl -s \
        https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | \
        bash
fi

PROV_ROOT="/vagrant/provisioning"
HOME_DIR="/home/vagrant"

# Make sure the required SSH keys exist.
if [ -f $PROV_ROOT/ssh/id_rsa ] && [ -f $PROV_ROOT/ssh/id_rsa.pub ]; then
    # Copy SSH keys.
    # These keys should be added to any accounts you may use within your
    # projects.
    /bin/cp $PROV_ROOT/ssh/id_rsa $PROV_ROOT/ssh/id_rsa.pub $HOME_DIR/.ssh/
else
    echo >&2 "ERROR: Missing id_rsa or id_rsa.pub in provisioning/ssh/ dir.";
    echo >&2 "Run `vagrant provision` after you have resolved the issue.";
    exit 1;
fi

# Copy our custom .bash_aliases file & correct file ownership.
/bin/cp $PROV_ROOT/bash_aliases.sh $HOME_DIR/.bash_aliases
