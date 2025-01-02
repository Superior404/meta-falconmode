# require u-boot-stm32mp-common_${PV}.inc
# require u-boot-stm32mp.inc

FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-stm32mp:"

SRC_URI += "file://falconmode_defconfig"

# inherit u-boot
# inherit externalsrc
# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND
# EXTERNALSRC:pn-u-boot-stm32mp = "/home/aletod/OwnDistr/build/workspace/sources/u-boot-stm32mp"

do_configure:prepend() {
    # Anwenden der Konfigurationsänderungen
    cat ${WORKDIR}/falconmode_defconfig >> ${S}/configs/stm32mp15_defconfig
    # cd ${S}
    # make stm32mp15_basic_defconfig
    # cat ${WORKDIR}/falconmode_defconfig >> ${S}/.config
    # make 
    cat ${WORKDIR}/falconmode_defconfig >> ${S}/configs/stm32mp13_defconfig
}
