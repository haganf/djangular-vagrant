`djangular-vagrant`
===================

This project provides a basic Ubuntu Server 14.04 LTS virtual machine for developing Django/AngularJS applications.  It provides a blank slate with `nvm` and `virtualenv` for sudo-less project scaffolding and was built to provide a common ground between the [BioComputing Facility](http://bcf.arl.arizona.edu/)'s team of non-standard development machines. :family:

What's In The Box?
------------------

### System Packages ###

* [Apache 2](http://projects.apache.org/projects/http_server.html)
* [`git`](http://git-scm.com)
* [`python2.7-dev`](https://docs.python.org/2.7/)

### Included Tools ###

* [`nvm v0.23.3`](https://github.com/creationix/nvm/tree/v0.23.3)
* [`virtualenvwrapper`](http://virtualenvwrapper.readthedocs.org/en/latest/)

Setup
-----

### Host Requirements ###

#### 1. Install Host Applications

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)

#### 2. Generate SSH Keys

The provisioning process expects a pair of SSH keys in `provisioning/ssh` named `id_rsa` and `id_rsa.pub`.  Altough these keys are intended to be used with project-specific provisioning that may not fit your workflow, this project was designed to work with a ton of BitBucket projects owned by a team for which the keys are required.

Usage
-----

Make sure you run Vagrant commands from the directory containing the Vagrantfile.

    vagrant up && vagrant ssh

FAQ
---

> **My project is special!** How should I add something to provisioning?

[Fork me](https://help.github.com/articles/fork-a-repo/)!

> **Something is missing!** How can I share something for provisioning?

[Send me a pull requst](https://help.github.com/articles/using-pull-requests/)! 

Troubleshooting
---------------

Keep in mind that you are running a headless Ubuntu server from your host machine.  These servers require periodic software updates and maintenance just like real servers out there in the wild.  You may run into issues during your development where you feel like you know exactly what your Django configurations should be doing, but something just isn't working.

1. Save all of your work in synced folders.  _Consider [`git flow feature publish`](https://danielkummer.github.io/git-flow-cheatsheet/)!_
2. Run `vagrant reload` from your host machine to restart the VM.
3. If 2. didn't solve your problem, try `vagrant reload --provision`.
4. If 3. didn't solve your problem, try `vagrant destroy && vagrant up` from your host machine to rebuild the VM.  You will need to reconfigure any global project settings after this step.

Still having a problem?  [Log an issue](http://github.com/colinsf/djangular-vagrant/issues/new)!  :smirk_cat:




TODO:


a) Use chocolatey as much as possible

vagrant plugin install vagrant-vbguest

script to remove /home/vagrant/.virtualenvs/*/var/virtualenv-status

Install git-flow

get setup:

git config --global push.default simple
git config --global user.email "franks@email.arizona.edu"
git config --global user.name "Hagan Franks"

::on a project::
git push --set-upstream origin develop

::need .profile added::
export WORKON_HOME=~/.virtualenvs
. /usr/local/bin/virtualenvwrapper.sh

exit script to deactivate bash or zsh!

FIX our local id_rsa.pub -> authorized_keys

look at linking all /home/vagrant/dev/**/envs/* -> .virtualenvs/

for i in $(ls -d ~/dev/*/envs/*); do
  j=$(basename $i)
  echo "linking: $i -> ~/.virtualenvs/$j"
  ln -s $i -t ~/.virtualenvs $j
done


setup .pgpass for postgres user?!?
echo "localhost:5432:*:postgres:notverysecure" > ~/.pgpass
chmod 600 ~/.pgpass


## npm install -g jspm jspm-git gulp
jspm endpoint create bitbucket jspm-git
    ssh://git@bitbucket.org/
SETUP github token
jspm init
ACTIVATE SSH AGENT BEFORE jspm install!!!
jspm install
gulp

WINDOWS ISSUES
need to fix permissions on windows rsync'd folders
  find /path/to/base/dir -type d -exec chmod 755 {} +
  find /path/to/base/dir -type f -exec chmod 644 {} +


