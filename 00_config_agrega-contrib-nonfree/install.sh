#!/bin/bash
# ACTION: Agrega repositorios Debian contrib y non-free
# INFO: Repositorios no activos por defecto
# DEFAULT: y

# Chequea root
[ "$(id -u)" -ne 0 ] && { echo "Must run as root" 1>&2; exit 1; }


(
# Agrega contrib 
deb_lines_contrib="$(egrep '^(deb|deb-src) (http://deb.debian.org/debian/|http://security.debian.org/debian-security)' /etc/apt/sources.list | grep -v contrib)"
IFS=$'\n'
for l in $deb_lines_contrib; do
	sed -i "s\\^$l$\\$l contrib\\" /etc/apt/sources.list
done

# Agrega non-free 
deb_lines_nonfree="$(egrep '^(deb|deb-src) (http://deb.debian.org/debian/|http://security.debian.org/debian-security)' /etc/apt/sources.list | grep -v "non-free[[:blank:]]")"
for l in $deb_lines_nonfree; do
	sed -i "s\\^$l$\\$l non-free\\" /etc/apt/sources.list
done
)


# Actualiza e instala paquetes...
apt-get update  
