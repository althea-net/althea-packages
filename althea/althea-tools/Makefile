#
# Copyright (C) 2017-2018 Justin Kilpatrick
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=althea-tools
PKG_VERSION:=0.1.0
PKG_RELEASE:=1
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/althea-tools
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea Tools
  MAINTAINER:= Justin Kilpatrick <justin@althea.net>
  DEPENDS:=@IPV6 +iperf3 +ifstat +iftop +mtr +nano +tcpdump
endef

define Package/althea-tools/description
  Tools for Althea firmware development and debugging
endef

$(eval $(call BuildPackage,althea-tools))