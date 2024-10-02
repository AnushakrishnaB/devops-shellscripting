#!/bin/bash
if [ -e /etc/passwd1 ]; then
    echo "File exists"
else
    echo "File doesn't exist and its created"
    echo $(date) >>/etc/passwd1
fi
