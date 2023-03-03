#
# Copyright (C) 2017-2018 Justin Kilpatrick, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# you must set $RUST_TRIPLE in your env
include $(TOPDIR)/rules.mk

PKG_NAME:=rita-extender
PKG_VERSION:=0.20.12
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-net/althea_rs
PKG_SOURCE_VERSION:=d06fcb0eff1ff1a2c741a514c54da63a75b35127
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/rita-extender
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea Rita Extender
  URL:=https://github.com/althea-net/althea_rs
  MAINTAINER:= Justin Kilpatrick <justin@althea.net>
  DEPENDS:=@IPV6 +ca-bundle +ca-certificates +kmod-sched-cake +tc
  PKG_BUILD_DEPENDS:=openssl
endef

define Package/rita-extender/description
  Althea Rita Extender
endef

RITA_PATH:="$(PKG_BUILD_DIR)/target/$(RUST_TRIPLE)/release/rita_extender"

define Build/Compile
	(\
		cd $(PKG_BUILD_DIR) && \
		cargo install cross && \
		cross build --release --target $(RUST_TRIPLE) -p rita_bin --bin rita_extender \
	)
	$(STRIP) $(RITA_PATH)
endef

define Package/rita-extender/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(RITA_PATH) $(1)/usr/sbin/rita_extender
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/rita_extender.init $(1)/etc/init.d/rita_extender
	$(INSTALL_DIR) $(1)/etc/crontabs/
	$(CP) ./files/checkup.ash $(1)/etc/
	$(CP) ./files/root $(1)/etc/crontabs/
endef

$(eval $(call BuildPackage,rita-extender))
