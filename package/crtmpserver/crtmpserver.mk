#############################################################
#
# crtmpserver
#
#############################################################

CRTMPSERVER_VERSION=b866fffca37c3b967a8878499cd2b91aa2587f34
CRTMPSERVER_SITE = https://github.com/shiretu/crtmpserver.git
CRTMPSERVER_SITE_METHOD = git
CRTMPSERVER_CONF_OPTS = -DCRTMPSERVER_INSTALL_PREFIX=/usr
CRTMPSERVER_INSTALL_TARGET:=YES
CRTMPSERVER_DEPENDENCIES = openssl lua tinyxml
CRTMPSERVER_SUBDIR = builders/cmake
CRTMPSERVER_MAKE=$(MAKE1)

#define CRTMPSERVER_BUILD_CMDS
#	$(MAKE) PLATFORM=linux CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" -C $(@D)/builders/make all
#endef
#
#define CRTMPSERVER_INSTALL_TARGET_CMDS
#	$(INSTALL) -D -m 0755 $(@D)/crtmpserver $(TARGET_DIR)/usr/sbin
#endef

$(eval $(cmake-package))
