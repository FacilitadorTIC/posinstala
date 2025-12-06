#!/bin/bash
# ACTION: Instala Chromium, set has default browser
# INFO: Chromium es un navegador web
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Como root!" 1>&2; exit 1; }

# Install package
echo -e "\e[1mInstalando paquetes...\e[0m"
apt-get install -y chromium-l10n
#apt-get remove chromium

# default?
#echo -e "\e[1mSeteando como predeterminado...--REVISAR\e[0m"
#update-alternatives --set x-www-browser /usr/bin/google-chrome-stable
#update-alternatives --set gnome-www-browser /usr/bin/google-chrome-stable
