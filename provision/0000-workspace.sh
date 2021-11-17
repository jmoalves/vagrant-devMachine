#!/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Informe the provisionning user
    echo
    exit 1
fi

sudo usermod -aG vboxsf $provUser
sudo -iu $provUser mkdir -p /media/sf_storage/workspace
sudo -iu $provUser ln -s /media/sf_storage/workspace ~$provUser/
