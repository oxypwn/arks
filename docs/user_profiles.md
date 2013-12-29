

# Profiles

Profiles is a simple textfile with the all the variables, settings and dependencies to trigger the installation of a node. 


```
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
MR_BOOTSTRAP=https://raw.github.com/pandrew/pandrew-home/master/.mrconfig```
```

# Config variables:

### HOSTNAME
Example:

```
HOSTNAME="archlinux"
```

Set the hostname for this node.

### USERNAME
Example:

```
USERNAME="pandrew"
```

Set the username for the user being added.

### GROUP
Example:

```
GROUP="users"
```

Set the default group for user being added.

### ADDTOGROUPS
Example:

```
ADDTOGROUPS="sudo"
```

Add user to any additional group.


### USERS_SHELL
Example:

```
USERS_SHELL="zsh"
```

Set users shell.


### MR_BOOTSTRAP
Example:
```
MR_BOOTSTRAP=https://raw.github.com/pandrew/pandrew-home/master/.mrconfig
```

Bootsrap your `$HOME` with mr.

