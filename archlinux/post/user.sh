#!/usr/bin/env bash

# Add users
ARRAY_USERS=(${USERNAMES})
val=${#ARRAY_USERS[*]}
for (( i=0; i<=$(( $val -1 )); i++ )); do
    URL="${REMOTE}/archlinux/users/"${ARRAY_USERS[$i]}".sh"
    curl -fsL $URL
        if [[ "$?" == 0 ]]; then
            . <(curl -fsL $URL)
            if [[ $USERS_SHELL != bash ]]; then
                _installpkg "$USERS_SHELL"
            fi  
            useradd -m -g "$GROUP" -G "$ADDTOGROUPS" -s /usr/bin/"$USERS_SHELL" "$USERNAME"
            _mrbootstrap "$MR_BOOTSTRAP"
            # Set default password to username given
            # username:password
            echo "$USERNAME:$USERNAME" | chpasswd
            passwd -e "$USERNAME"
        fi
done

# Add root
. <(curl -fsL "${REMOTE}/archlinux/users/root.sh")

