#!/bin/bash

sudo apt-get install -y apt-transport-https ca-certificates gnupg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

curl -L https://packages.cloud.google.com/apt/doc/apt-key.gpg 2> /dev/null | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

sudo apt-get update -y && sudo apt-get install -y google-cloud-sdk

