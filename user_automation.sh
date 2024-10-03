#!/bin/bash
#set -x -e
if [ $# -gt 0 ]; then
    USERS=$@
    for USER in ${USERS[@]}; do
        if [[ "${USER}" =~ ^[a-zA-Z]+$ ]]; then
            EXISTING_USER=$(cat /etc/passwd | grep -i -w $USER | cut -d ":" -f1)
            if [ "${EXISTING_USER}" = "${USER}" ]; then
                echo "USER WITH USERNAME $USER ALREADY EXISTS. TRY A DIFFERENT NAME"
            else
                echo "Lets create user $USER"
                sudo useradd -m $USER --shell /bin/bash
                SPEC='!@#$%^&*()_'
                SPEC_CHAR=$(echo $SPEC | fold -w1 | shuf | head -1)
                PASSWORD=Indi@${RANDOM}${SPEC_CHAR}
                echo "$USER:$PASSWORD" | sudo chpasswd
                passwd -e $USER
                echo $PASSWORD
            fi
        else
            echo "The Username Must Contain Only Alphabets"
        fi
    done
else
    echo " Please enter valid input"
fi
