#############################################################
#
# crtmpserver
#
#############################################################

CRTMPSERVER_VERSION=b866fff
CRTMPSERVER_SITE = https://github.com/shiretu/crtmpserver.git
CRTMPSERVER_SITE_METHOD = git
CRTMPSERVER_CONF_OPTS = -DCRTMPSERVER_INSTALL_PREFIX=/usr
CRTMPSERVER_INSTALL_TARGET:=YES
CRTMPSERVER_DEPENDENCIES = openssl lua tinyxml
CRTMPSERVER_SUBDIR = builders/cmake
CRTMPSERVER_MAKE=$(MAKE1)

define CRTMPSERVER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/builders/cmake/crtmpserver/crtmpserver $(TARGET_DIR)/usr/sbin
	$(INSTALL) -D -m 0700 $(@D)/builders/cmake/applications/admin/libadmin.so $(TARGET_DIR)/usr/lib/crtmpserver/applications/admin
	$(INSTALL) -D -m 0700 $(@D)/builders/cmake/applications/appselector/libappselector.so $(TARGET_DIR)/usr/lib/crtmpserver/applications/appselector
	$(INSTALL) -D -m 0600 $(@D)/builders/cmake/applications/appselector/server.crt $(TARGET_DIR)/usr/lib/crtmpserver/applications/appselector/ssl
	$(INSTALL) -D -m 0600 $(@D)/builders/cmake/applications/appselector/server.key $(TARGET_DIR)/usr/lib/crtmpserver/applications/appselector/ssl
	$(INSTALL) -D -m 0700 $(@D)/builders/cmake/applications/flvplayback/libflvplayback.so $(TARGET_DIR)/usr/lib/crtmpserver/applications/flvplayback
	$(INSTALL) -D -m 0700 $(@D)/builders/cmake/applications/samplefactory/libsamplefactory.so $(TARGET_DIR)/usr/lib/crtmpserver/applications/samplefactory
	$(INSTALL) -D -m 0700 $(@D)/builders/cmake/applications/vptests/libvptests.so $(TARGET_DIR)/usr/lib/crtmpserver/applications/vptests
	$(INSTALL) -D -m 0700 $(@D)/builders/cmake/applications/proxypublish/libproxypublish.so $(TARGET_DIR)/usr/lib/crtmpserver/applications/proxypublish
	$(INSTALL) -D -m 0700 $(@D)/builders/cmake/applications/stresstest/libstresstest.so $(TARGET_DIR)/usr/lib/crtmpserver/applications/stresstest
	$(INSTALL) -D -m 0700 $(@D)/builders/cmake/crtmpserver/crtmpserver.lua $(TARGET_DIR)/usr/crtmpserver
	$(INSTALL) -D -m 0700 $(@D)/configs/flvplayback.lua $(TARGET_DIR)/etc/crtmpserver
endef

$(eval $(cmake-package))
