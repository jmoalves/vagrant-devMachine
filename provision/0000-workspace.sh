#!/bin/bash

sudo usermod -aG vboxsf vagrant
sudo -iu vagrant mkdir -p /media/sf_storage/workspace
sudo -iu vagrant ln -s /media/sf_storage/workspace ~vagrant/
