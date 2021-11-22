#!/bin/bash

version=1.16.2
url=https://github.com/denoland/deno/releases/download/v${version}/deno-x86_64-unknown-linux-gnu.zip

echo $url

tmpFile=$( mktemp )
if ! curl -L $url -o $tmpFile 2> /dev/null; then
    exit 1
fi
unzip -q $tmpFile -d /usr/lib
rm $tmpFile

echo '#!/bin/bash
PATH=/usr/lib/deno:$PATH
export PATH
' > /etc/profile.d/deno.sh
chmod a+x /etc/profile.d/deno.sh

. /etc/profile.d/deno.sh
