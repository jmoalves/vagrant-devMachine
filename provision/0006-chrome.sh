#!/bin/bash

curl -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/chrome.deb 2>/dev/null

sudo apt-get install -y -f /tmp/chrome.deb
sudo apt-get update

rm -f /tmp/chrome.deb
