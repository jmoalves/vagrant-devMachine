#!/bin/bash

sudo apt-get -y install curl grep

nexusRepo=http://192.168.15.200:8081/repository/ubuntu-focal/
nexusStatus=$( curl -o /dev/null -s -w "%{http_code}\n" ${nexusRepo} )	
if [ $nexusStatus == 200 ]; then
    if grep -qv "$nexusRepo" /etc/apt/sources.list; then
        echo === Nexus APT Proxy for Ubuntu found
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.orig && \
            cat /etc/apt/sources.list.orig \
            | sed "s@http://.*\.?archive\.ubuntu\.com/ubuntu@${nexusRepo}@g" \
            > /etc/apt/sources.list
    else
        echo === Nexus APT Proxy for Ubuntu already configured
    fi
fi
