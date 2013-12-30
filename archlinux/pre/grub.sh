#!/bin/bash
# https://wiki.archlinux.org/index.php/Beginners%27_Guide#GRUB
_installpkg grub
modprobe dm-mod
grub-mkconfig -o /boot/grub/grub.cfg
grub-install --target=i386-pc --recheck --force ${INSTALL_DRIVE}
mkdir -p /boot/grub/locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

# Temporarily fix
# 
mv /boot/grub/grub.cfg{.new,}
