#!/bin/bash
# ACTION: Install Pluma and set as default editor for Openbox
# INFO: Pluma is a lightweight text editor from the MATE project
# DEFAULT: y

# Check root
[ "$(id -u)" -ne 0 ] && { echo "Ejecutar como root" 1>&2; exit 1; }

echo -e "\e[1mInstalando Pluma...\e[0m"
apt-get update
apt-get install -y pluma || exit 1

# Set as default
echo -e "\e[1mConfigurando Pluma como la alternativa por defecto...\e[0m"

# Register pluma in update-alternatives (if not already)
update-alternatives --install /usr/bin/x-text-editor x-text-editor /usr/bin/pluma 90

# Select pluma as the default editor
update-alternatives --set x-text-editor /usr/bin/pluma

echo -e "\e[1mDone. Pluma is now your default GUI text editor.\e[0m"
