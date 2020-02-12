#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=althea-dash
PKG_VERSION:=0.3.11
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-mesh/althea-dash
PKG_SOURCE_VERSION:=2d6a016943485bf1e8960eefbbbbe09355702520
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/althea-dash
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea Dashboard
  URL:=https://github.com/althea-mesh/althea-dash
  MAINTAINER:= Justin Kilpatrick <justin@althea.net>
  DEPENDS:=@IPV6 +uhttpd
endef

define Package/althea-dash/description
  UI for controlling the behavior of Althea from your web browser
endef

define Build/Compile
	( \
	cd $(PKG_BUILD_DIR) &&\
	yarn && yarn build \
	)
endef

define Package/althea-dash/install
	$(INSTALL_DIR) $(1)/www/althea
	$(CP) $(PKG_BUILD_DIR)/build/* $(1)/www/althea
	$(CP) ./files/index.html $(1)/www/
endef

$(eval $(call BuildPackage,althea-dash))
