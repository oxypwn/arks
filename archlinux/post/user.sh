#!/usr/bin/env bash
[[ $ARKS_TRACE ]] && $DEBUGVARS

# Add users
array=($USERNAMES);
for ((i=0; i<${#array[@]}; ++i)); do
    URL="${REMOTE}/archlinux/users/"${array[$i]}".sh"
    curl -fsL $URL
        if [[ "$?" == 0 ]]; then
            . <(curl -fsL $URL)
            if [[ $USERS_SHELL != bash ]]; then
                _installpkg "$USERS_SHELL"
            fi
            _installpkg $LOGIN_SHELL
            useradd -m -g "$GROUP" -G "$ADDTOGROUPS" -s "$LOGIN_SHELL" "$USERNAME"
            _mrbootstrap "$MR_BOOTSTRAP"
            # Set default password to username given
            # username:password
            echo "$USERNAME:$USERNAME" | chpasswd
            passwd -e "$USERNAME"
        fi
done

# Add root
. <(curl -fsL "${REMOTE}/archlinux/users/root.sh")

