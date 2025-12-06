#!/bin/bash
# ACTION: Instala paquetes GUI básicos
# INFO: Paquetes como: vlc gmtp mtp-tools synaptic galternatives evince
# DEFAULT: y

# Chequea root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }

# Instala...
echo -e "\e[1mInstalling packages...\e[0m"
[ "$(find /var/cache/apt/pkgcache.bin -mtime 0 2>/dev/null)" ] || apt-get update  
apt-get install -y vlc gmtp synaptic galternatives evince
apt-get install -y firmware-linux-nonfree
  