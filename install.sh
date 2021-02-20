#!/bin/bash

curl https://storage.googleapis.com/git-repo-downloads/repo > repo
chmod a+x repo
install repo /usr/local/bin

pip install -q pyrogram tgcrypto
