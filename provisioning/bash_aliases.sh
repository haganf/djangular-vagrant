# ~/.bash_aliases sourced by ~/.bashrc
# This file should contain any .bashrc customizations you may want to use
# within your shell.

##
# nvm: https://github.com/creationix/nvm/blob/v0.23.3/install.sh
##

    # These lines are usually appended to ~/.bashrc after install, but since we
    # install nvm during provisioning, they happen here instead.
    export NVM_DIR="/home/vagrant/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
    [[ -r $NVM_DIR/bash_completion ]] && source $NVM_DIR/bash_completion

##
# virtualenvwrapper: https://virtualenvwrapper.readthedocs.org/en/latest/install.html#shell-startup-file
##

    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/dev
    export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
    source /usr/local/bin/virtualenvwrapper_lazy.sh

##
# custom: http://manpages.ubuntu.com/manpages/hardy/man1/alias.1posix.html
##

    # Here is an alias for the Django webserver.  Roll your own!
    alias webserver="python manage.py runserver 0.0.0.0:8000"
