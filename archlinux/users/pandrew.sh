#!/usr/bin/env bash

groupadd wireshark
groupadd vboxusers
groupadd kvm
groupadd libvirt


# load userspecific settings from here
USERNAME=pandrew
GROUP="users"
ADDTOGROUPS="audio,lp,optical,storage,video,games,power,scanner,network,wheel,sudo,docker,sys,wireshark,vboxusers,kvm,libvirt"
LOGIN_SHELL=/bin/zsh
MR_BOOTSTRAP=https://raw.github.com/pandrew/pandrew-home/master/.mrconfig

