#############################################################
#
# ldr-reader
#
#############################################################

LDR_READER_VERSION=c3848a5c73a88f378fde267a64ec2401dd80f1b0
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
