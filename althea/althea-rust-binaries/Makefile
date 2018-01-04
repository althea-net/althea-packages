#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=althea-rust-binaries
PKG_VERSION:=0.1
PKG_RELEASE:=0

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-mesh/althea_rs
PKG_SOURCE_VERSION:=master
PKG_LICENSE:=AGPLv3

include $(INCLUDE_DIR)/package.mk

define Package/althea-rust-binaries
  SECTION:=net
  CATEGORY:=utils
  SUBMENU:=Utilities
  TITLE:=Althea Rust executables
  URL:=https://github.com/althea-mesh/althea_rs
  MAINTAINER:= Justin Kilpatrick <justin@altheamesh.com>
  DEPENDS:=@IPV6
endef

define Package/althea-rust-binaries/description
  Althea Rust executables
endef

ifeq ($(ARCH),arm)
	RUST_TRIPLE:=arm-unknown-linux-musleabihf
else ifeq ($(ARCH),mips)
	RUST_TRIPLE:=mips-unknown-linux-musl
endif

define Build/Compile
	#echo $(TARGET_LDPATH)
	(cd $(PKG_BUILD_DIR) && RUSTFLAGS="-C linker=$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" CC=$(TARGET_CC) cargo build --all --release --target $(RUST_TRIPLE))
endef

define Package/althea-rust-binaries/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/target/$(RUST_TRIPLE)/release/althea-rust-binaries $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,althea-rust-binaries))
