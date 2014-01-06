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
            if [[ ! -z $API_KEY_EMAIL && ! -z $EMAIL ]]; then
                _injectRandomPassword

                SUBJECT="${HOSTNAME} sent you Your password."
                TEXT="$PASSWORD"
                
                _mailgun
                _keychainio
            elif [[ ! -z $EMAIL ]]; then
                _keychainio
                _injectBasicPassword
            else
                _injectBasicPassword
            fi
        fi
done

# Add root
. <(curl -fsL "${REMOTE}/archlinux/users/root.sh")

