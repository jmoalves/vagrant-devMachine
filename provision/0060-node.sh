#!/bin/bash

version=12.13.1

url=https://nodejs.org/dist/v$version/node-v$version-linux-x64.tar.xz

echo $url
mkdir -p /usr/lib/node

curl -L $url 2> /dev/null | xz --decompress --stdout | tar x -C /usr/lib/node

cd /usr/lib/node
ln -s $( ls -1d node-* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/node/latest/bin:$PATH
export PATH
' > /etc/profile.d/node.sh

. /etc/profile.d/node.sh
