#Checking string operators
#!/bin/bash
A=''
if [ -z $A ]; then
    echo "VALUE NOT DECLARED"
else
    echo "The Value of A is $A"
fi
