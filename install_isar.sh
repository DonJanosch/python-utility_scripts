#!bin/sh
# Make sure to use this as root or have sudo at start
# Updating the system
apt update && apt dist-upgrade -y

# Installing dependencies (shoudl be installed already)
apt install python3-distutils -y
apt install binfmt-support debootstrap dosfstools dpkg-dev gettext-base git mtools parted python3 quilt qemu qemu-user-static reprepro sudo -y

# Perparing the system
