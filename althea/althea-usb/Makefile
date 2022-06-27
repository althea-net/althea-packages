#
# Copyright (C) 2017-2018 Justin Kilpatrick
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=althea-usb
PKG_VERSION:=0.1.0
PKG_RELEASE:=1
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk

define Package/althea-usb
  SECTION:=net
  CATEGORY:=Utilities
  SUBMENU:=Althea
  TITLE:=Althea USB Support
  MAINTAINER:= Thomas Spellman <thomas@althea.systems>
  DEPENDS:=+usbutils +kmod-usb-storage +kmod-usb-storage-uas +kmod-usb-core +kmod-usb3 +kmod-usb-uhci +kmod-usb-ohci \
  +kmod-usb2 +kmod-usb-ohci-pci +kmod-usb2-pci +block-mount +e2fsprogs +kmod-fs-ext4 +kmod-usb-net +kmod-usb-net-rtl8152 +kmod-usb-net-rtl8150 \
  +kmod-usb-net-cdc-eem +kmod-usb-net-cdc-ether +kmod-usb-net-cdc-mbim +kmod-usb-net-cdc-ncm +kmod-usb-net-cdc-subset +kmod-usb-net-ipheth
endef

define Package/althea-usb/description
  Althea USB support, primarily removable storage and ethernet adaptors
endef

$(eval $(call BuildPackage,althea-usb))
