#!/bin/bash
# ACTION: Instala CLI packages
# INFO: Instalar paquetes como: vim zip unzip rar unrar mtp-tools mailutils traceroute acl gnupg2 mlocate apt-transport-https curl ntfs-3g
# DEFAULT: y

# Chequea root
[ "$(id -u)" -ne 0 ] && { echo "Debe ser root" 1>&2; exit 1; }

# Instala paquetes...
echo -e "\e[1mInstalling packages...\e[0m"
[ "$(find /var/cache/apt/pkgcache.bin -mtime 0 2>/dev/null)" ] || apt-get update  
apt-get install -y vim zip unzip rar unrar mtp-tools mailutils traceroute acl gnupg2 mlocate apt-transport-https curl ntfs-3g
apt-get install -y firmware-linux-nonfree
  