#!/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Inform the provisioning user
    echo
    exit 1
fi
homeDir=$( grep "^$provUser" /etc/passwd | cut -d ":" -f6 )

url=https://download.knime.org/analytics-platform/linux/knime-latest-linux.gtk.x86_64.tar.gz
# Windows - https://download.knime.org/analytics-platform/win/knime-latest-win32.win32.x86_64.zip

if [ ! -e /media/sf_storage/knime-workspace ]; then
    sudo -iu $provUser mkdir -p /media/sf_storage/knime-workspace
fi

if [ ! -e $homeDir/knime-workspace ]; then
    sudo -iu $provUser ln -s /media/sf_storage/knime-workspace $homeDir/
fi

# Dependencies
sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

mkdir -p /usr/lib/knime

echo $url
if ! curl -L "$url" 2> /dev/null | tar -xzC /usr/lib/knime; then
    exit 1
fi

cd /usr/lib/knime
ln -s $( ls -1d knime* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/knime/latest:$PATH
export PATH
' > /etc/profile.d/knime.sh
chmod a+x /etc/profile.d/knime.sh

. /etc/profile.d/knime.sh
