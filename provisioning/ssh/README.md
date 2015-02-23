SSH Keys
========

### From the `djangular-vagrant` root:

    ssh-keygen -f provisioning/ssh/id_rsa -C "apoc@nebuchadnezzar"

_**NOTE:** Key comments are designed to help **you** identify the machine that holds that key._

After you have generated your SSH keys, be sure to add the pubkey to any services from which you will be sourcing projects.

[More details on generating SSH keys](https://help.github.com/articles/generating-ssh-keys/).
