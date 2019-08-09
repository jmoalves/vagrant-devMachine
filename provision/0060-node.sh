#!/bin/bash

version=10.16.2

url=https://nodejs.org/dist/v$version/node-v$version-linux-x64.tar.xz

echo === Node - $url
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
