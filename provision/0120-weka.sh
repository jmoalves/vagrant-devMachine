#!/bin/bash

url=https://prdownloads.sourceforge.net/weka/weka-3-8-5.zip

sudo -iu vagrant mkdir -p /media/sf_storage/weka-workspace
sudo -iu vagrant ln -s /media/sf_storage/weka-workspace ~vagrant/

# Dependencies
#sudo apt-get install -y libcanberra-gtk-module libcanberra-gtk3-module

echo $url
mkdir -p /usr/lib/weka

tmpFile=$( mktemp )
curl -L $url -o $tmpFile 2> /dev/null
unzip $tmpFile -d /usr/lib/weka
rm $tmpFile

cd /usr/lib/weka
ln -s $( ls -1d weka* | tail -1 ) latest
cd - > /dev/null

echo '#!/bin/bash
myDir=$( dirname "$0" )
java -jar $myDir/weka.jar "$@"
' > /usr/lib/weka/latest/weka.sh

echo '#!/bin/bash
PATH=/usr/lib/weka/latest:$PATH
export PATH
' > /etc/profile.d/weka.sh

. /etc/profile.d/weka.sh
