url=https://www-us.apache.org/dist/maven/maven-3/3.6.1/binaries/apache-maven-3.6.1-bin.tar.gz

echo === Maven - $url

mkdir -p /usr/java-env/maven
curl -L $url 2> /dev/null | tar xz -C /usr/java-env/maven

cd /usr/java-env/maven
ln -s $( ls -1d apache-maven-* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
MAVEN_HOME=/usr/java-env/maven/latest
PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_HOME PATH
' > /etc/profile.d/maven.sh

. /etc/profile.d/maven.sh
