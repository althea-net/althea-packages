#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# you must set $RUST_TRIPLE in your env
include $(TOPDIR)/rules.mk

PKG_NAME:=rita-exit
PKG_VERSION:=0.22.0
PKG_RELEASE:=0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-net/althea_rs/
PKG_SOURCE_VERSION:=ebcb855040c347ef3d7925abc9a42d745ba891b2
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/rita-exit
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Rita Exit
  URL:=https://github.com/althea-net/althea_rs
  MAINTAINER:= Justin Kilpatrick <justin@althea.net>
  DEPENDS:=@IPV6 @USE_GLIBC +althea-babeld +ipset +kmod-wireguard +wireguard-tools +rpcd +ca-bundle +ca-certificates +kmod-sched-cake +tc
  PKG_BUILD_DEPENDS:=openssl
endef

define Package/rita-exit/description
  Althea Rita Exit
endef


RITA_PATH:="$(PKG_BUILD_DIR)/target/$(RUST_TRIPLE)/release/rita_exit"

define Build/Compile
	(\
		cd $(PKG_BUILD_DIR) && \
		cargo install cross && \
		cross build --release --target $(RUST_TRIPLE) -p rita_bin --bin rita_exit \
	)
	$(STRIP) $(RITA_PATH)
endef

define Package/rita-exit/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(RITA_PATH) $(1)/usr/sbin/rita_exit
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/rita-exit.init $(1)/etc/init.d/rita-exit
endef

$(eval $(call BuildPackage,rita-exit))

