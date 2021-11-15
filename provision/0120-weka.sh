#!/bin/bash

url="https://prdownloads.sourceforge.net/weka/weka-3-8-5.zip"

sudo -iu vagrant mkdir -p /media/sf_storage/weka-workspace
sudo -iu vagrant ln -s /media/sf_storage/weka-workspace ~vagrant/

# Dependencies
#sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

mkdir -p /usr/lib/weka

echo $url
curl -L "$url" 2> /dev/null | tar xz -C /usr/lib/weka

cd /usr/lib/weka
ln -s $( ls -1d weka* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/weka/latest:$PATH
export PATH
' > /etc/profile.d/weka.sh

. /etc/profile.d/weka.sh
