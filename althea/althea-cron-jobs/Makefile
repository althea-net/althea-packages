#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=althea-cron-jobs
PKG_VERSION:=0.2.0
PKG_RELEASE:=1

PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/althea-cron-jobs
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea auto update cron jobs
  URL:=https://github.com/alhtea-mesh/althea-firmware
  MAINTAINER:= Justin Kilpatrick <justin@altheamesh.com>
  DEPENDS:=+curl
endef

define Package/althea-cron-jobs/description
  Enables cron to run on boot and defines a update time and script for Althea
  related packages
endef

define Build/Compile
	( \
    echo "Nothing to do"\
	)
endef

define Package/althea-cron-jobs/install
	$(INSTALL_DIR) $(1)/etc/crontabs/
	$(CP) ./files/update.ash $(1)/etc/
	$(CP) ./files/checkup.ash $(1)/etc/
	$(CP) ./files/root $(1)/etc/crontabs/

endef

$(eval $(call BuildPackage,althea-cron-jobs))
