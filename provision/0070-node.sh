url=https://nodejs.org/dist/v8.11.3/node-v8.11.3-linux-x64.tar.xz

echo === Node - $url
mkdir -p /usr/java-env/node

curl -L $url 2> /dev/null | tar xJ -C /usr/java-env/node

cd /usr/java-env/node
ln -s $( ls -1d node-* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/java-env/node/latest/bin:$PATH
export PATH
' > /etc/profile.d/node.sh

. /etc/profile.d/node.sh
