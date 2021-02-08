#!/bin/bash

cd ${HOME}
mkdir recovery && cd recovery

git config --global user.email "rizal82rebel@gmail.com"
git config --global user.name "rzlamrr"

repo init -u git://github.com/SHRP/platform_manifest_twrp_omni.git -b v3_9.0
repo sync | tee sync.txt

git clone ${PAT} device/xiaomi/ginkgo

masak() {
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch omni_ginkgo-eng
mka recoveryimage
}

tgup() {
curl -F name=document -F document=@${1} -H "Content-Type:multipart/form-data" "https://api.telegram.org/bot${TOKED}/sendDocument?chat_id=1095222353"
}

masak | tee log.txt
tgup sync.txt
tgup log.txt

ls
echo "========================="
ls out/target/product/*/
tgup $(echo out/target/product/ginkgo/SHRP_v*.zip)
tgup $(echo out/target/product/ginkgo/SHRP_AddonRescue*.zip)
rm -rf *
