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
PKG_SOURCE_VERSION:=9e7859c0db2208b66f7de7dd520924e4533df26d
PKG_LICENSE:=Apache-2.0

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

RUST_BIN_FILENAMES:=guac-light-client rita
RUST_BIN_PATHS:=$(foreach filename, $(RUST_BIN_FILENAMES), $(PKG_BUILD_DIR)/target/$(RUST_TRIPLE)/release/$(filename))

define Build/Compile
	(\
		cd $(PKG_BUILD_DIR) && \
\
		RUSTFLAGS="-C linker=$(TARGET_CC)" \
		TARGET=$(RUST_TRIPLE) \
		CC=$(TARGET_CC) \
		CFLAGS="$(TARGET_CFLAGS)" \
		TARGET_CFLAGS="$(TARGET_CFLAGS)" \
		CXX=$(TARGET_CXX) \
		CXXFLAGS="$(TARGET_CXXFLAGS)" \
		TARGET_CXXFLAGS="$(TARGET_CXXFLAGS)" \
\
		cargo build --all --release --target $(RUST_TRIPLE) \
	)
	$(STRIP) $(RUST_BIN_PATHS)
endef

define Package/althea-rust-binaries/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(RUST_BIN_PATHS) $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,althea-rust-binaries))