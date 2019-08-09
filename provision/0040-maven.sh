#!/bin/bash

version=3.6.1
url=https://www-us.apache.org/dist/maven/maven-3/$version/binaries/apache-maven-$version-bin.tar.gz

echo === Maven - $url

mkdir -p /usr/lib/maven
curl -L $url 2> /dev/null | tar xz -C /usr/lib/maven

cd /usr/lib/maven
ln -s $( ls -1d apache-maven-* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
MAVEN_HOME=/usr/lib/maven/latest
PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_HOME PATH
' > /etc/profile.d/maven.sh

. /etc/profile.d/maven.sh
