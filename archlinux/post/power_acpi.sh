#!/bin/bash
#
# acpi power
# https://wiki.archlinux.org/index.php/Acpi

[[ $ARKS_TRACE ]] && $DEBUGVARS

_installpkg acpi acpid cpupower powertop
systemctl enable acpid.service

