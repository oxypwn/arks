

# Profiles

Profiles is a simple textfile with the all the variables, settings and dependencies to trigger the installation of a node. 

### Warning!
It should be noted that profiles should be treated as secrets as they might contain api keys to do some of the more advance functions such as sending email.

```
#!/usr/bin/env bash

HOSTNAME=mercury
USERNAMES="pandrew vagrant"
FONT=ter-116n
FONT_MAP=8859-1
LANGUAGE=en_US.UTF-8
KEYMAP=svoraka5
TIMEZONE=Europe/Stockholm
MODULES="dm_mod dm_crypt aes_x86_64 ext2 ext4 vfat intel_agp drm i915"
HOOKS="base udev autodetect block keyboard consolefont encrypt filesystems fsck shutdown"
AUDIO=post/audio_alsa
APPSETS=""
PACKAGES="git"
AURPACKAGES=""

NETWORK_PROFILE="post/net0-static"
IPADDRESS="192.168.2.21/24"
GATEWAY="192.168.2.1"
DNS="'8.8.8.8' '8.8.4.4'"

BRANCH=master
 
# Set remote location to run from, source functions and run install
REMOTE=https://raw.github.com/pandrew/arks/$BRANCH
. <(curl -fsL "${REMOTE}/archlinux/_lib/functions.sh"); _loadblock "_lib/install"
```

Config variables:
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


### REMOTE
Example: 

``` 
REMOTE=https://raw.github.com/pandrew/kickstart/master/archlinux/
```


## Not implemented
### API_KEY_EMAIL
Example:

```
API_KEY_EMAIL=api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0
```

If this is set you will recieve your password via email. You will be forced to change your account password when you login for the first time.


### ERROR_EMAIL
Example:
```
ERROR_EMAIL=adm@paulnotco.se
```
If an error occur the system will jump out of the installation loop and give you the option to fix the block or enter a shell. If `ERROR_EMAIL` is set an
email is sent to the address with hostname and what block it reported an error on.


FONT		    Example: FONT=ter-116n
FONT_MAP		Example: FONT_MAP=8859-1
LANGUAGE		Example: LANGUAGE=en_US.UTF-8
KEYMAP		    Example: KEYMAP=svoraka5
TIMEZONE		Example: TIMEZONE="Europe/Stockholm"
MODULES		    Example: MODULES="dm_mod dm_crypt aes_x86_64"
HOOKS		    Example: HOOKS="base udev"
AUDIO		    Example: AUDIO="post/audio_alsa"
APPSETS		    Example: APPSETS="appsets/virtual"
IPADRESS		Example: IPADRESS=192.168.1.18/24
INSTALL_DRIVE	Example: INSTALL_DRIVE="/dev/sda"
PACKAGES		Example: PACKAGES="git golang mutt"
AURPACKAGES		Example: AURPACKAGES="git-annex-bin"
NETWORK_PROFILE Example: NETWORK_PROFILE="post/enp2s0"
IPADDRESS       Example: IPADDRESS="192.168.2.67"
GATEWAY         Example: GATEWAY="192.168.2.1"
DNS             Example: DNS="192.168.2.1"

