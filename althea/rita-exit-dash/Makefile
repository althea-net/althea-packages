#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rita-exit-dash
PKG_VERSION:=0.5.0
PKG_RELEASE:=0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-net/rita-exit-dash
PKG_SOURCE_VERSION:=da438aedeba0a5c1caaac427b114d46bd0633abe
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/rita-exit-dash
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea Dashboard
  URL:=https://github.com/althea-net/rita-exit-dash
  MAINTAINER:= Justin Kilpatrick <justin@althea.net>
  DEPENDS:=@IPV6 +uhttpd
endef

define Package/rita-exit-dash/description
  UI for controlling the behavior of Althea from your web browser
endef

define Build/Compile
	( \
	cd $(PKG_BUILD_DIR) &&\
	yarn && yarn build \
	)
endef

define Package/rita-exit-dash/install
	$(INSTALL_DIR) $(1)/www/althea
	$(CP) $(PKG_BUILD_DIR)/build/* $(1)/www/althea
	$(CP) ./files/index.html $(1)/www/
endef

$(eval $(call BuildPackage,rita-exit-dash))
