#!/bin/bash
if [ $# -gt 0 ]; then
    USERS=$@
    for USER in ${USERS[@]}; do
        EXISTING_USER=$(cat /etc/passwd | grep -i -w krishna | cut -d ":" -f1)
        if [ "${EXISTING_USER}" = "${USER}" ]; then
            echo "USER WITH USERNAME $USER ALREADY EXISTS. TRY A DIFFERENT NAME"
        else
            echo "Lets create user $USER"
            sudo useradd -m $USER --shell /bin/bash
        fi
    done
else
    echo " Please enter valid input"
fi
