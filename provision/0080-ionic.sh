#!/bin/bash

sudo -iu vagrant yarn global add ionic
sudo -iu vagrant ionic config set -g yarn true
sudo -iu vagrant ionic config set -g npmClient yarn
