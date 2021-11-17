#!/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Inform the provisioning user
    echo
    exit 1
fi

sudo -iu $provUser yarn global add @ionic/cli cordova
sudo -iu $provUser ionic config set -g yarn true
sudo -iu $provUser ionic config set -g npmClient yarn
