#!/bin/bash

curl https://storage.googleapis.com/git-repo-downloads/repo > repo
chmod a+x repo
install repo /usr/local/bin

apt install -qqy python3-pip python3
pip3 install -q pyrogram tgcrypto
