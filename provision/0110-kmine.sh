#!/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Inform the provisioning user
    echo
    exit 1
fi

url=https://download.knime.org/analytics-platform/linux/knime-latest-linux.gtk.x86_64.tar.gz

sudo -iu $provUser mkdir -p /media/sf_storage/knime-workspace
sudo -iu $provUser ln -s /media/sf_storage/knime-workspace ~$provUser/

# Dependencies
sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

mkdir -p /usr/lib/knime

echo $url
curl -L "$url" 2> /dev/null | tar xz -C /usr/lib/knime

cd /usr/lib/knime
ln -s $( ls -1d knime* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/knime/latest:$PATH
export PATH
' > /etc/profile.d/knime.sh
chmod a+x /etc/profile.d/knime.sh

. /etc/profile.d/knime.sh
