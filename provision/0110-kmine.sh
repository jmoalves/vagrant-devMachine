#!/bin/bash

knimeFile=../kit/knime_4.4.2.linux.gtk.x86_64.tar.gz

sudo -iu vagrant mkdir -p /media/sf_storage/knime-workspace
sudo -iu vagrant ln -s /media/sf_storage/knime-workspace ~vagrant/

# Dependencies
sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

mkdir -p /usr/lib/knime

echo $knimeFile
curl -L "$knimeFile" 2> /dev/null | tar xz -C /usr/lib/knime

cd /usr/lib/knime
ln -s $( ls -1d knime* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/knime/latest:$PATH
export PATH
' > /etc/profile.d/knime.sh

. /etc/profile.d/knime.sh
