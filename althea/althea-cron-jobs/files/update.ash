#!/bin/ash
set -eux
CHANGED=false
date > /etc/lastupdatecheck

set +e
opkg update
set -e

if opkg install althea-cron-jobs | grep -q 'Configuring'; then
  CHANGED=true
fi

set +e
# Update exit settings only when other software is being updated
if $CHANGED; then
curl --max-time 300 --header "Content-Type: application/json" --request GET --data '{"url": "https://updates.altheamesh.com/exits"}' 192.168.10.1:4877/exits/sync
fi
set -e

if opkg install althea-dash | grep -q 'Configuring'; then
  CHANGED=true
fi
if opkg install althea-rust-binaries | grep -q 'Configuring'; then
  CHANGED=true
fi
if opkg install althea-babeld | grep -q 'Configuring'; then
  CHANGED=true
fi

# https://wiki.openwrt.org/doc/howto/cron
# Note: To avoid infinite reboot loop, wait 70 seconds
# and touch a file in /etc so clock will be set
# properly to 4:31 on reboot before cron starts.
if $CHANGED; then
date > /etc/lastupdated
sleep 70 && touch /etc/banner && reboot
fi
