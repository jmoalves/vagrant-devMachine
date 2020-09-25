#!/bin/bash

#url="https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/2019-09/R/eclipse-jee-2019-09-R-linux-gtk-x86_64.tar.gz&mirror_id=576"
#url="http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2019-09/R/eclipse-jee-2019-09-R-linux-gtk-x86_64.tar.gz"
#url="http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2019-12/R/eclipse-jee-2019-12-R-linux-gtk-x86_64.tar.gz"
url="http://eclipse.c3sl.ufpr.br/technology/epp/downloads/release/2020-09/R/eclipse-jee-2020-09-R-linux-gtk-x86_64.tar.gz"

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

