#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=althea-cron-exit
PKG_VERSION:=0.2.5
PKG_RELEASE:=0

PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/althea-cron-exit
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea auto update cron jobs
  URL:=https://github.com/althea-mesh/althea-firmware
  MAINTAINER:= Justin Kilpatrick <justin@althea.net>
  DEPENDS:=+curl +!DEFAULT_libustream-wolfssl:libustream-openssl +ca-bundle +ca-certificates
endef

define Package/althea-cron-exit/description
  Enables cron to run on boot and defines a update time and script for Althea
  related packages
endef

define Build/Compile
	( \
    echo "Nothing to do"\
	)
endef

define Package/althea-cron-exit/install
	$(INSTALL_DIR) $(1)/etc/crontabs/
	$(CP) ./files/checkup.ash $(1)/etc/
	$(CP) ./files/root $(1)/etc/crontabs/

endef

$(eval $(call BuildPackage,althea-cron-exit))
