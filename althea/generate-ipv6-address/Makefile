#
# Copyright (C) 2017-2018 Justin Kilpatrick, Juliusz Chroboczek, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=generate-ipv6-address
PKG_VERSION:=0.1
PKG_RELEASE:=2

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-mesh/generate-ipv6-address
PKG_SOURCE_VERSION:=master
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/generate-ipv6-address
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=A small utility for generating IPv6 addresses
  URL:=https://www.irif.fr/~jch/software/
  MAINTAINER:= Justin Kilpatrick <justin@altheamesh.com>
  DEPENDS:=@IPV6
endef

define Package/generate-ipv6-address/description
 A small utility for generating IPv6 addresses
endef

MAKE_FLAGS+= \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDLIBS="" \

define Package/generate-ipv6-address/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/generate-ipv6-address $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,generate-ipv6-address))
