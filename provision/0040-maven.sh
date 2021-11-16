#!/bin/bash

version=3.8.3
url=https://dlcdn.apache.org/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz

echo $url

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
chmod a+x /etc/profile.d/maven.sh

. /etc/profile.d/maven.sh
