#/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Inform the provisioning user
    echo
    exit 1
fi
homeDir=$( grep "^$provUser" /etc/passwd | cut -d ":" -f6 )

if [ ! -d $homeDir/.ssh ]; then
    mkdir -p $homeDir/.ssh
    chown $provUser.$provUser $homeDir/.ssh
    chmod 700 $homeDir/.ssh
fi

if [ ! -e $homeDir/.stable_ssh_keys ]; then
    sudo -iu $provUser mkdir -p /media/sf_storage/.stable_ssh_keys
    sudo -iu $provUser ln -s /media/sf_storage/.stable_ssh_keys $homeDir/.stable_ssh_keys
fi

if [ ! -f $homeDir/.stable_ssh_keys/id_rsa.pub ]; then
    yes "" | sudo -u $provUser ssh-keygen -t rsa -N '' -f $homeDir/.stable_ssh_keys/id_rsa
fi

if [ ! -f $homeDir/.ssh/config ]; then
    sudo -u $provUser echo "
    host *
        IdentityFile ~/.stable_ssh_keys/id_rsa
    " > $homeDir/.ssh/config

    chown $provUser.$provUser $homeDir/.ssh/config
    chmod 400 $homeDir/.ssh/config
fi
