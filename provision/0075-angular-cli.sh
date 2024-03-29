#!/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Inform the provisioning user
    echo
    exit 1
fi

sudo -iu $provUser yarn global add @angular/cli
sudo -iu $provUser ng config -g cli.packageManager yarn
