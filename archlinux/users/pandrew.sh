#!/usr/bin/env bash

groupadd wireshark
groupadd vboxusers
groupadd kvm
groupadd libvirt


# load userspecific settings from here
USERNAME=pandrew
GROUP="users"
ADDTOGROUPS="audio,lp,optical,storage,video,games,power,scanner,network,wheel,sudo,sys,wireshark,vboxusers,kvm,libvirt"
USERS_SHELL=zsh
MR_BOOTSTRAP=https://raw.github.com/pandrew/pandrew-home/master/.mrconfig

