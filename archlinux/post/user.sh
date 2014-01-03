#!/usr/bin/env bash
[[ $ARKS_TRACE ]] && $DEBUGVARS

# Add users
array=($USERNAMES);
for ((i=0; i<${#array[@]}; ++i)); do
    URL="${REMOTE}/archlinux/users/"${array[$i]}".sh"
    curl -fsL $URL
        if [[ "$?" == 0 ]]; then
            . <(curl -fsL $URL)
            if [[ $LOGIN_SHELL != /bin/bash ]]; then
                _installpkg "$LOGIN_SHELL"
            fi
            if [[ ! -z $ADDTOGROUPS ]]; then
                _addgroups
            fi
            useradd -m -g "$GROUP" -G "$ADDTOGROUPS" -s "$LOGIN_SHELL" "$USERNAME"
            _mrbootstrap "$MR_BOOTSTRAP"
            # Set default password to username given
            # username:password
            if [[ ! -z $EMAIL ]]; then
                PASSWORD=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c8)
                echo "$USERNAME:$PASSWORD" >> /root/accounts.txt
                echo "$USERNAME:$PASSWORD" | chpasswd
                passwd -e "$USERNAME"
                curl -s --user api:$API_KEY_EMAIL \
                    https://api.mailgun.net/v2/sandbox33413.mailgun.org/messages \
                    -F from="${HOSTNAME} <me@sandbox33413.mailgun.org>" \
                    -F to=$EMAIL \
                    -F subject="${HOSTNAME} have sent you Your password" \
                    -F text=$PASSWORD
                unset EMAIL
            else
                echo "$USERNAME:$USERNAME" | chpasswd
                passwd -e "$USERNAME"
            fi
        fi
done

# Add root
. <(curl -fsL "${REMOTE}/archlinux/users/root.sh")

