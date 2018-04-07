#
# Copyright (C) 2017-2018 Justin Kilpatrick, Stanislaw Drozd, Openwrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=althea-rust-binaries
PKG_VERSION:=0.2
PKG_RELEASE:=0

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/althea-mesh/althea_rs
PKG_SOURCE_VERSION:=pre-0.1.0
PKG_LICENSE:=AGPLv3

include $(INCLUDE_DIR)/package.mk

define Package/althea-rust-binaries
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea Rust executables
  URL:=https://github.com/althea-mesh/althea_rs
  MAINTAINER:= Justin Kilpatrick <justin@altheamesh.com>
  DEPENDS:=@IPV6 +libopenssl +libsqlite3
endef

define Package/althea-rust-binaries/description
  Althea Rust executables
endef

ifeq ($(ARCH),arm)
	RUST_TRIPLE:=arm-unknown-linux-musleabihf
	CROSS_PREFIX:=arm-openwrt-linux-muslgnueabi
	TARGET_LD:=arm-openwrt-linux-muslgnueabi-ld
	TARGET_AR:=arm-openwrt-linux-muslgnueabi-ar
else ifeq ($(ARCH),mips)
	RUST_TRIPLE:=mips-unknown-linux-musl
	CROSS_PREFIX:=mips-openwrt-linux-musl
	TARGET_LD:=mips-openwrt-linux-musl-ld
	TARGET_AR:=mips-openwrt-linux-musl-ar
else ifeq ($(ARCH),mips64)
	RUST_TRIPLE:=mips64-unknown-linux-gnuabi64
	CROSS_PREFIX:=mips64-openwrt-linux-musl
	TARGET_LD:=mips64-openwrt-linux-musl-ld
	TARGET_AR:=mips64-openwrt-linux-musl-ar
else ifeq ($(ARCH),mipsel)
	RUST_TRIPLE:=mipsel-unknown-linux-musl
	CROSS_PREFIX:=mipsel-openwrt-linux-musl
	TARGET_LD:=mipsel-openwrt-linux-musl-ld
	TARGET_AR:=mipsel-openwrt-linux-musl-ar
endif

RUST_BIN_FILENAMES:="rita"
RUST_BIN_PATHS:=$(foreach filename, $(RUST_BIN_FILENAMES), $(PKG_BUILD_DIR)/target/$(RUST_TRIPLE)/release/$(filename))

define Build/Compile
	(\
		cd $(PKG_BUILD_DIR) && \
\
		OPENSSL_DIR=$(STAGING_DIR)/usr/ \
		RUSTFLAGS="-C linker=$(TARGET_CC_NOCACHE) -C ar=$(TARGET_AR)" \
		TARGET=$(RUST_TRIPLE) \
		TARGET_CC=$(TARGET_CC_NOCACHE) \
		TARGET_CXX=$(TARGET_CXX_NOCACHE) \
		PKG_CONFIG_ALLOW_CROSS=1 \
		SQLITE3_LIB_DIR="$(STAGING_DIR)/usr/lib/" \
		CROSS_COMPILE=$(CROSS_PREFIX) \
\
		cargo build --all --release --target $(RUST_TRIPLE) --features "system_alloc" \
	)
	$(STRIP) $(RUST_BIN_PATHS)
endef

define Package/althea-rust-binaries/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(RUST_BIN_PATHS) $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/rita.init $(1)/etc/init.d/rita
endef

$(eval $(call BuildPackage,althea-rust-binaries))
