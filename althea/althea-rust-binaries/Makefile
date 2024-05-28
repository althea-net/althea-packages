#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
# This package is named for legacy reasons it should be named simply 'rita'
# you must set $RUST_TRIPLE in your env
include $(TOPDIR)/rules.mk

PKG_NAME:=althea-rust-binaries
PKG_VERSION:=0.21.12
PKG_RELEASE:=0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-net/althea_rs
PKG_SOURCE_VERSION:=5fb78d389ca39096c9714b78cd043f5d2b35295f
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/althea-rust-binaries
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea Rita
  URL:=https://github.com/althea-net/althea_rs
  MAINTAINER:= Justin Kilpatrick <justin@althea.net>
  DEPENDS:=@IPV6 +althea-babeld +ipset +kmod-wireguard +wireguard-tools +rpcd +ca-bundle +ca-certificates +kmod-sched-cake +tc
  PKG_BUILD_DEPENDS:=openssl
endef

define Package/althea-rust-binaries/description
  Althea Rita
endef

RITA_PATH:="$(PKG_BUILD_DIR)/target/$(RUST_TRIPLE)/release/rita"

define Build/Compile
	(\
		cd $(PKG_BUILD_DIR) && \
		cargo install cross && \
		cross build --release --target $(RUST_TRIPLE) -p rita_bin --bin rita \
	)
	$(STRIP) $(RITA_PATH)
endef

define Package/althea-rust-binaries/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(RITA_PATH) $(1)/usr/sbin/rita
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/rita.init $(1)/etc/init.d/rita
endef

$(eval $(call BuildPackage,althea-rust-binaries))
