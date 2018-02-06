#############################################################
#
# ldr-reader
#
#############################################################

LDR_READER_VERSION=37f893fede85ee99f8e6d6a75d2d9d0f063b6790
LDR_READER_SITE = https://github.com/jasaw/ldr-reader.git
LDR_READER_SITE_METHOD = git
LDR_READER_INSTALL_TARGET:=YES

define LDR_READER_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define LDR_READER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/ldr-reader $(TARGET_DIR)/usr/sbin
endef

$(eval $(generic-package))
