url=https://github.com/yarnpkg/yarn/releases/download/v1.7.0/yarn-v1.7.0.tar.gz

echo === Yarn - $url
mkdir -p /usr/java-env/yarn

curl -L $url 2> /dev/null | tar xz -C /usr/java-env/yarn

cd /usr/java-env/yarn
ln -s $( ls -1d yarn-* | tail -1 ) latest
cd -

echo '#!/bin/bash
PATH=/usr/java-env/yarn/latest/bin:$PATH
export PATH
' > /etc/profile.d/yarn.sh

