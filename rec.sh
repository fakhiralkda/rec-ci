#!/bin/bash

#cd ${HOME}
#mkdir recovery && cd recovery

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
mka recoveryimage -j48
}

#export TELEGRAM="${HOME}"/telegram
chmod +x telegram
tg() {
    ./telegram -t "${TOKED}" -c "1095222353"  -H "${1}"
}

tgup() {
    ./telegram -t "${TOKED}" -c "1095222353" -f "${1}" -H "${2}"
}

masak | tee log.txt
tgup sync.txt sync.txt
tgup log.txt log.txt

ls
echo "========================="
ls out/target/product/*/
ZIPNAME="$(echo out/target/product/ginkgo/SHRP_v*.zip)"
ADDONRESC="$(echo out/target/product/ginkgo/SHRP_AddonRescue*.zip)"
tgup ${ZIPNAME} ${ZIPNAME}
tg $(echo $(curl --upload-file ./${ZIPNAME} https://transfer.sh/${ZIPNAME}))
tgup ${ADDONRESC} ${ADDONRESC}
tg $(echo $(curl --upload-file ./${ADDONRESC} https://transfer.sh/${ADDONRESC}))
rm -rf *
