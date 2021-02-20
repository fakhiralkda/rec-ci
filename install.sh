#!/bin/bash
apt -qqy update
apt -qqy upgrade

curl https://storage.googleapis.com/git-repo-downloads/repo > repo
chmod a+x repo
install repo /usr/local/bin

apt -qqy install python3-pip
pip3 install -q pyrogram tgcrypto
