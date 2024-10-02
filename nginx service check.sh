#!/bin/bash
service nginx status | grep -i -w running
if[ $? -eq 0 ]
then
echo " service is running"
else
echo " service is not running"
service nginx start
curl http://localhost
fi