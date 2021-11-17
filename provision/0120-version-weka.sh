#!/bin/bash

provUser=$1
if [ -z "$provUser" ]; then
    echo Inform the provisioning user
    echo
    exit 1
fi
homeDir=$( grep "^$provUser" /etc/passwd | cut -d ":" -f6 )

url=https://prdownloads.sourceforge.net/weka/weka-3-9-5-azul-zulu-linux.zip

if [ ! -e /media/sf_storage/weka-workspace ]; then
    sudo -iu $provUser mkdir -p /media/sf_storage/weka-workspace
fi

if [ ! -e $homeDir/weka-workspace ]; then
    sudo -iu $provUser ln -s /media/sf_storage/weka-workspace $homeDir/
fi

# Dependencies
#sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

echo $url
mkdir -p /usr/lib/weka

tmpFile=$( mktemp )
curl -L $url -o $tmpFile 2> /dev/null
unzip -q $tmpFile -d /usr/lib/weka
rm $tmpFile

cd /usr/lib/weka
ln -s $( ls -1d weka* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
PATH=/usr/lib/weka/latest:$PATH
export PATH
' > /etc/profile.d/weka.sh
chmod a+x /etc/profile.d/weka.sh

. /etc/profile.d/weka.sh
