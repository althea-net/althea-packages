#!/bin/ash
set -eux

set +e
curl -f --max-time 300 127.0.0.1:4875/
# if the ping fails we should restart
if [ 0 -ne $? ]; then
/etc/init.d/babeld restart
/etc/init.d/rita-exit restart
date > /etc/lastcrash
fi
set -e
