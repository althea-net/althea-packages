#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# you must set $RUST_TRIPLE in your env
include $(TOPDIR)/rules.mk

PKG_NAME:=althea-rust-binaries
PKG_VERSION:=0.18.2
PKG_RELEASE:=4

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-net/althea_rs
PKG_SOURCE_VERSION:=68e299df18b840098db41bb925f0f97a9631f2e9
PKG_LICENSE:=AGPLv3

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

ifeq ($(ARCH),mips)
        CROSS_PREFIX:=mips-openwrt-linux-musl
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),arm)
        CROSS_PREFIX:=arm-openwrt-linux-muslgnueabi
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),aarch64)
        CROSS_PREFIX:=aarch64-openwrt-linux-gnu
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),mips64)
        CROSS_PREFIX:=mips64-openwrt-linux
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),mipsel)
        CROSS_PREFIX:=mipsel-openwrt-linux-musl
        RUSTFLAGS:="-C linker=$(TARGET_CC_NOCACHE)"
else ifeq ($(ARCH),x86_64)
        CROSS_PREFIX:=x86_64-openwrt-linux-musl
        RUSTFLAGS:=""
endif

RITA_PATH:="$(PKG_BUILD_DIR)/target/$(RUST_TRIPLE)/release/rita"

define Build/Compile
	(\
		cd $(PKG_BUILD_DIR) && \
\
		OPENSSL_DIR=$(STAGING_DIR)/usr/ \
		TARGET=$(RUST_TRIPLE) \
		SQLITE3_LIB_DIR="$(STAGING_DIR)/usr/lib/" \
		CROSS_COMPILE=$(CROSS_PREFIX) \
		TARGET_CC=$(TARGET_CC_NOCACHE) \
		RUSTFLAGS=$(RUSTFLAGS) \
		OPENSSL_STATIC=1 \
\
		cargo build --release --target $(RUST_TRIPLE) -p rita_bin --bin rita \
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
