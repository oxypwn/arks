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
            _mrbootstrap
            if [[ ! -z "$API_KEY_EMAIL" && ! -z "$EMAIL" ]]; then
                _keychainio
                _injectRandomPassword

                SUBJECT="${HOSTNAME} sent you Your password."
                TEXT="$PASSWORD"
                _mailgun
            elif [[ ! -z $EMAIL ]]; then
                if [[ "$USERNAME" == vagrant ]]; then
                    _keychainio
                    _injectStaticPassword
                else
                    _keychainio
                    _injectBasicPassword
                fi
            else
                _injectBasicPassword
            fi
        fi
    unset EMAIL
    unset MR_BOOTSTRAP
done

# Add root
. <(curl -fsL "${REMOTE}/archlinux/users/root.sh")

