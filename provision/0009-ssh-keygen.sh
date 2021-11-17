#/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Informe the provisionning user
    echo
    exit 1
fi

sudo -iu $provUser mkdir -p /media/sf_storage/.stable_ssh_keys
sudo -iu $provUser ln -s /media/sf_storage/.stable_ssh_keys ~$provUser/.stable_ssh_keys

if [ ! -f ~$provUser/.stable_ssh_keys/id_rsa.pub ]; then
    yes "" | sudo -u $provUser ssh-keygen -t rsa -N '' -f ~$provUser/.stable_ssh_keys/id_rsa
fi

sudo -u $provUser echo "
host *
    IdentityFile ~/.stable_ssh_keys/id_rsa
" > ~$provUser/.ssh/config

chown $provUser.$provUser ~$provUser/.ssh/config
chmod 400 ~$provUser/.ssh/config
