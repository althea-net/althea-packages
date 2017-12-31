#
# Copyright (C) 2007-2009 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=althea-babeld
PKG_VERSION:=0.1
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-mesh/babeld
PKG_SOURCE_VERSION:=4e88ef5eab18afcadfdd3739c4637de7e62d76a0
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/althea-babeld
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Routing and Redirection
  TITLE:=A fork of the Babel protocol focued on payment for routing
  URL:=http://altheamesh.com
  MAINTAINER:= Justin Kilpatrick <justin@altheamesh.com>
  DEPENDS:=@IPV6 +generate-ipv6-address +grep
endef

define Package/althea-babeld/description
 Experimental fork of the Babeld daemon for Althea, use with care.  

 Babel is a loop-avoiding distance-vector routing protocol roughly based
 on DSDV and AODV, but with provisions for link cost estimation and
 redistribution of routes from other routing protocols.
 While it is optimised for wireless mesh networks, Babel will also work
 efficiently on wired networks. It will generate between 1.2 and 2.4 times
 the amount of routing traffic that RIPng would generate, while
 never counting to infinity.

 Credit to Juliusz Chroboczek and other Babel contributors for the protocol
 and to Garbiel Kerneis and Baptise Jonglez who maintain the LEDE Babeld
 packge from which this package was derived.
endef

define Package/althea-babeld/conffiles
/etc/babeld.conf
/etc/config/babeld
endef

MAKE_FLAGS+= \
	CFLAGS="$(TARGET_CFLAGS)" \
	LDLIBS="" \

define Package/althea-babeld/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/babeld $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_CONF) ./files/babeld.conf $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/babeld.config $(1)/etc/config/babeld
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/babeld.init $(1)/etc/init.d/babeld
endef

$(eval $(call BuildPackage,althea-babeld))
