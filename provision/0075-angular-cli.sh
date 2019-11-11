#!/bin/bash

sudo -iu vagrant yarn global add @angular/cli
sudo -iu vagrant ng config -g cli.packageManager yarn
