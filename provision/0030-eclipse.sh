## Eclipse
mkdir -p /usr/java-env/ide/eclipse

sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

url=https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2019-06/R/eclipse-jee-2019-06-R-linux-gtk-x86_64.tar.gz&r=1

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
