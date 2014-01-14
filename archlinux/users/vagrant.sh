#!/usr/bin/env bash
# load userspecific settings from here
USERNAME=vagrant
GROUP="users"
ADDTOGROUPS="audio,lp,optical,storage,video,games,power,scanner,network,wheel,sudo,sys,wireshark,vboxusers,kvm,libvirt"
# NOTICE! Using a shell not listed in /etc/shells with full path will dissallow login. Be shure to have correct path to shell.
LOGIN_SHELL=/bin/bash
