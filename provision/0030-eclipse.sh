## Eclipse
mkdir -p /usr/java-env/ide/eclipse

sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

url=http://mirror.nbtelecom.com.br/eclipse/technology/epp/downloads/release/oxygen/3a/eclipse-jee-oxygen-3a-linux-gtk-x86_64.tar.gz
echo === Eclipse - $url
curl -L $url 2> /dev/null | tar xz -C /usr/java-env/ide/eclipse

cd /usr/java-env/ide/eclipse
ln -s $( ls -1d eclipse* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/java-env/ide/eclipse/latest:$PATH
export PATH
' > /etc/profile.d/eclipse.sh

. /etc/profile.d/eclipse.sh
