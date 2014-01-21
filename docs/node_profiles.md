

# Profiles

Profiles is a simple textfile with the all the variables, settings and dependencies to trigger the installation of a node. 

### Warning!
It should be noted that profiles should be treated as secrets as they might contain api keys to do some of the more advance functions such as sending email.

```
#!/usr/bin/env bash
ARKS_TRACE=1
DEBUGVARS="set -x"

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
RE MOTE=https://raw.github.com/pandrew/arks/$BRANCH
. <(curl -fsL "${REMOTE}/archlinux/_lib/functions.sh"); _loadblock "_lib/install"
```

Config variables:
### HOSTNAME
Exa mple: 

```
HOSTNAME="archlinux"
```

Set the hostname for this node.
### ARKS_TRACE, DEBUGVARS
Example:

```
ARKS_TRACE=1
DEBUGVARS="set -x"
```

To enable traceing and debugging set ARKS_TRACE to 1. Set DEBUGVARS to any debugging settings of your choice.

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


### API_KEY_EMAIL
Example:

```
API_KEY_EMAIL=api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0
```


If this is set you will recieve your password via email. You will be forced to change your account password when you login for the first time.

### API_URI_EMAIL
Example:

```
API_URI_EMAIL=
```

The full uri to email api provider.

### API_FROM_EMAIL
Example:

```
API_FROM_EMAIL=me@mydomain.apidomain.com
```

The address from which the email should be sent from.

### INSTALL_DRIVE
Example:

```
INSTALL_DRIVE=/dev/sda
```
If you have multiple harddrives in your computer arks wont be able to detect which you want to install to. You can specify this with INSTALL_DRIVE. Default is /dev/sda

### APPSETS
Example:

```
APPSETS="appsets/virtual"
```

With APPSETS we can specify multiple packages and customizations for these packages to be installed. In  this case "appsets/virtual" coud install virtualbox or kvm or both. We can also set dependencies as groups or any other settings.

### PACKAGES
Example:
```
PACKAGES="git golang mutt"
```

Setting this will allow us to install specified packages from repository.

### AURPACKAGES
Example:
```
AURPACKAGES="git-annex-bin"
```

Setting this will allow us to install specified packages from aur.

### NETWORK_PROFILE
Example:
```
NETWORK_PROFILE="post/net0-static"
```

Using network profiles we can set any settings we need to get network up and running.

 
### IPADDRESS
Example:
```
IPADDRESS="192.168.1.2/24"
```

Set ip address for profile `net0-static` using ip address/cidr format.


### GATEWAY
Example: 
```
GATEWAY="192.168.2.1"
```

Set gateway for your system.

### DNS
Example: 
```
DNS="192.168.2.1"
```

Set dns for your system.


### AUDIO
Example:
```
AUDIO=”post/audio_alsa”
```

This variable points you to your settings for audio.



### LANGUAGE	
Example:

```
LANGUAGE=en_US.UTF-8
```

Set the language for your system.


### FONT_MAP
Example:
```
FONT_MAP=8859-1
```

Set the font map for your system.


### FONT
Example:
```
FONT=ter-116n
```

Set font for your system.


### KEYMAP
Example:
```
KEYMAP=svoraka5
```

Set keymap for your system.


###TIMEZONE
Example:
```
TIMEZONE="Europe/Stockholm"
```

Set the timezone for your system.

### ERROR_EMAIL
Example:
```
ERROR_EMAIL=adm@paulnotcom.se
```
If an error occur the system will jump out of the installation loop and give you the option to fix the block or enter a shell. If `ERROR_EMAIL` is set an email is sent to the address with hostname and what block it reported an error on.


### MODULES
Example:
```
MODULES="dm_mod dm_crypt aes_x86_64"
```

Set modules for mkinitcpio.

### HOOKS
Example:
```
HOOKS="base udev"
```

Set hooks for mkinitcpio.
