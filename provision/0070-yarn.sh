#!/bin/bash

version=1.19.2
url=https://github.com/yarnpkg/yarn/releases/download/v$version/yarn-v$version.tar.gz

echo $url
mkdir -p /usr/lib/yarn

curl -L $url 2> /dev/null | tar xz -C /usr/lib/yarn

cd /usr/lib/yarn
ln -s $( ls -1d yarn-* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/yarn/latest/bin:$PATH
export PATH
PATH=$( yarn global bin ):$PATH
export PATH
' > /etc/profile.d/yarn.sh

. /etc/profile.d/yarn.sh
