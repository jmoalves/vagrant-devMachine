#!/bin/bash

version=1.22.17
url=https://github.com/yarnpkg/yarn/releases/download/v$version/yarn-v$version.tar.gz

echo $url
mkdir -p /usr/lib/yarn

if ! curl -L $url 2> /dev/null | tar -xzC /usr/lib/yarn; then
    exit 1
fi

cd /usr/lib/yarn
ln -s $( ls -1d yarn-* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/yarn/latest/bin:$PATH
export PATH
PATH=$( yarn global bin ):$PATH
export PATH
' > /etc/profile.d/yarn.sh
chmod a+x /etc/profile.d/yarn.sh

. /etc/profile.d/yarn.sh
