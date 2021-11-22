#!/bin/bash

version=3.8.4
url=https://dlcdn.apache.org/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz

echo $url

mkdir -p /usr/lib/maven
if ! curl -L $url 2> /dev/null | tar -xzC /usr/lib/maven; then
    exit 1
fi

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
