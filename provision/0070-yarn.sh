url=https://github.com/yarnpkg/yarn/releases/download/v1.9.4/yarn-v1.9.4.tar.gz

echo === Yarn - $url
mkdir -p /usr/java-env/yarn

curl -L $url 2> /dev/null | tar xz -C /usr/java-env/yarn

cd /usr/java-env/yarn
ln -s $( ls -1d yarn-* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/java-env/yarn/latest/bin:$PATH
export PATH

PATH=$( yarn global bin ):$PATH
export PATH
' > /etc/profile.d/yarn.sh

. /etc/profile.d/yarn.sh
