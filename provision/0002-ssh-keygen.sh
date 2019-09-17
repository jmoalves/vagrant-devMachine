#/bin/bash

sudo -iu vagrant mkdir -p /media/sf_storage/.stable_ssh_keys
sudo -iu vagrant ln -s /media/sf_storage/.stable_ssh_keys ~vagrant/.stable_ssh_keys

if [ ! -f ~vagrant/.stable_ssh_keys/id_rsa.pub ]; then
    yes "" | sudo -u vagrant ssh-keygen -t rsa -N '' -f ~vagrant/.stable_ssh_keys/id_rsa
fi

<< EOF > ~/.ssh/config
host *
    IdentityFile ~vagrant/.stable_ssh_keys/id_rsa.pub
EOF
