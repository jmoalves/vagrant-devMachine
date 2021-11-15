#!/bin/bash

eclipseVersion=2021-09

url="http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/${eclipseVersion}/R/eclipse-jee-${eclipseVersion}-R-linux-gtk-x86_64.tar.gz"

sudo -iu vagrant mkdir -p /media/sf_storage/eclipse-workspace
sudo -iu vagrant ln -s /media/sf_storage/eclipse-workspace ~vagrant/

# Dependencies
sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

mkdir -p /usr/lib/eclipse

echo $url
curl -L "$url" 2> /dev/null | tar xz -C /usr/lib/eclipse

cd /usr/lib/eclipse
ln -s $( ls -1d eclipse* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/eclipse/latest:$PATH
export PATH
' > /etc/profile.d/eclipse.sh

. /etc/profile.d/eclipse.sh

