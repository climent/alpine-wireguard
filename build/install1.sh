#!/bin/bash

# exit script if return code != 0
set -e

# Update the DNS resolvers
echo "[info] Setting DNS resolvers to Cloudflare..."
echo "nameserver 1.1.1.1" > '/etc/resolv.conf' || true
echo "nameserver 1.0.0.1" >> '/etc/resolv.conf' || true

# force apk update
apk update

echo "[info] Install base group and additional packages..."
apk add --no-cache gawk sed grep gzip supervisor nano vim ldns moreutils net-tools dos2unix unzip unrar htop jq openssl shadow tini drill curl

#echo "[info] set locale..."
#echo en_US.UTF-8 UTF-8 > '/etc/locale.gen'
#echo LANG="en_US.UTF-8" > '/etc/locale.conf'

# add user "nobody" to primary group "users" (will remove any other group membership)
usermod -g users nobody

# add user "nobody" to secondary group "nobody" (will retain primary membership)
usermod -a -G nobody nobody

# setup env for user nobody
mkdir -p '/home/nobody'
chown -R nobody:users '/home/nobody'
chmod -R 775 '/home/nobody'

# set user "nobody" home directory (needs defining for pycharm, and possibly other apps)
usermod -d /home/nobody nobody
 
# delete the root password
passwd -d root

# set shell for user nobody
chsh -s /bin/bash nobody
 
## additional cleanup for base only
#rm -rf /root/* \
#/usr/lib/firmware \
#/usr/lib/modules \
#/.dockerenv \
#/.dockerinit \
#/usr/share/info/*
