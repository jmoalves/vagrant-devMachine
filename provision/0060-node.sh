#!/bin/bash

# Ionic does not support this version yet
#version=12.13.0
version=10.17.0

url=https://nodejs.org/dist/v$version/node-v$version-linux-x64.tar.xz

echo $url
mkdir -p /usr/lib/node

curl -L $url 2> /dev/null | tar xJ -C /usr/lib/node

cd /usr/lib/node
ln -s $( ls -1d node-* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/node/latest/bin:$PATH
export PATH
' > /etc/profile.d/node.sh

. /etc/profile.d/node.sh
