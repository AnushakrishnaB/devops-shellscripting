#!/bin/bash
A=HELLO
B=HOLA
if [ "${A}" = "{$B}" ]; then
    echo "both are same"
else
    echo "not same"
fi
