FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-stm32mp:"

SRC_URI += "file://falconmode_defconfig"

do_configure:prepend() {
    cat ${WORKDIR}/falconmode_defconfig >> ${S}/configs/stm32mp15_basic_defconfig
}

do_compile:prepend() {
    make stm32mp15_basic_defconfig    
    make
}
