#!/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Inform the provisioning user
    echo
    exit 1
fi
homeDir=$( grep "^$provUser" /etc/passwd | cut -d ":" -f6 )

sudo usermod -aG vboxsf $provUser

if [ ! -e /media/sf_storage/workspace ]; then
    sudo -iu $provUser mkdir -p /media/sf_storage/workspace
fi

if [ ! -e $homeDir/workspace ]; then
    sudo -iu $provUser ln -s /media/sf_storage/workspace $homeDir/
fi
