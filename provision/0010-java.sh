version=8u181
build=b13
sessionId=96a7b8442fe848ef90c96a2fad6ed6d1

## Oracle Java
mkdir -p /usr/java-env/jdk

url=https://edelivery.oracle.com/otn-pub/java/jdk/$version-$build/$sessionId/jdk-$version-linux-x64.tar.gz

echo === JAVA - $url
curl -L -b "oraclelicense=a" $url 2> /dev/null | tar xz -C /usr/java-env/jdk

cd /usr/java-env/jdk
ln -s $( ls -1d jdk1.8* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
JAVA_HOME=/usr/java-env/jdk/latest
PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME PATH
' > /etc/profile.d/java.sh

. /etc/profile.d/java.sh
