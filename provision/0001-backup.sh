#!/bin/bash

crontab -u vagrant -l 2>/dev/null | {
	cat; 
	echo "5 * * * * sh /vagrant/rsyncBackup.sh";
} | crontab -u vagrant -

