#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# you must set $RUST_TRIPLE in your env
include $(TOPDIR)/rules.mk

PKG_NAME:=althea-exit
PKG_VERSION:=0.20.2
PKG_RELEASE:=0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-net/althea_rs/
PKG_SOURCE_VERSION:=e655b79376e1587eb44a3d070e7b59a21297c6cb
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/althea-exit
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea Exit
  URL:=https://github.com/althea-net/althea_rs
  MAINTAINER:= Justin Kilpatrick <justin@althea.net>
  DEPENDS:=@IPV6 @USE_GLIBC +althea-babeld +ipset +kmod-wireguard +wireguard-tools +rpcd +ca-bundle +ca-certificates +kmod-sched-cake +tc +pgsql-cli-ssl
  PKG_BUILD_DEPENDS:=openssl
endef

define Package/althea-exit/description
  Althea Exit
endef

ifeq ($(ARCH),mips)
        CROSS_PREFIX:=mips-openwrt-linux-gnu
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),arm)
        CROSS_PREFIX:=arm-openwrt-linux-gnueabi
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),aarch64)
        CROSS_PREFIX:=aarch64-openwrt-linux-gnu
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),mips64)
        CROSS_PREFIX:=mips64-openwrt-linux-gnu
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),mipsel)
        CROSS_PREFIX:=mipsel-openwrt-linux-gnu
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),x86_64)
        CROSS_PREFIX:=x86_64-openwrt-linux-gnu
        RUSTFLAGS:=""
endif


RITA_PATH:="$(PKG_BUILD_DIR)/target/$(RUST_TRIPLE)/release/rita_exit"

define Build/Compile
	(\
		cd $(PKG_BUILD_DIR) && \
\
		OPENSSL_DIR=$(STAGING_DIR)/usr/ \
		TARGET=$(RUST_TRIPLE) \
		CROSS_COMPILE=$(CROSS_PREFIX) \
		TARGET_CC=$(TARGET_CC_NOCACHE) \
		RUSTFLAGS=$(RUSTFLAGS) \
		OPENSSL_STATIC=1 \
\
		cargo build --release --target $(RUST_TRIPLE) -p rita_bin --bin rita_exit \
	)
	$(STRIP) $(RITA_PATH)
endef

define Package/althea-exit/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(RITA_PATH) $(1)/usr/sbin/rita-exit
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/rita-exit.init $(1)/etc/init.d/rita-exit
endef

$(eval $(call BuildPackage,althea-exit))

