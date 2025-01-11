FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot-stm32mp:"

SRC_URI += "file://falconmode_defconfig"

EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE} STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'

do_configure:prepend() {
    cat ${WORKDIR}/falconmode_defconfig >> ${S}/configs/stm32mp15_basic_defconfig
    oe_runmake -C ${S} stm32mp15_basic_defconfig CROSS_COMPILE=${TARGET_PREFIX}
}

do_compile:prepend() {
    # cat ${WORKDIR}/falconmode_defconfig >> ${S}/.config
    oe_runmake -C ${S} CROSS_COMPILE=${TARGET_PREFIX}
}
