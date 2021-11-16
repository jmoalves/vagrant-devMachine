#/bin/bash

curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o /tmp/vscode.deb 2>/dev/null
sudo apt-get update
sudo apt-get install -y -f /tmp/vscode.deb libxss1
rm -f /tmp/vscode.deb


### Extensions

sudo -iu vagrant code --force \
    --install-extension vscjava.vscode-java-pack \
    --install-extension ms-azuretools.vscode-docker \
    --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
