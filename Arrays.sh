#!/bin/bash
AWS_REGIONS=(us-east-1 us-east-2 us-west-1 us-west-2)
echo ${AWS_REGIONS[@]}
echo ${AWS_REGIONS[*]}
echo ${AWS_REGIONS[0]}
echo ${AWS_REGIONS[@]:3}

for REGION in ${AWS_REGIONS[@]}; do
    echo "Lets get VPC ID for $REGION"
    aws ec2 describe-vpcs --region $REGION | jq ".Vpcs[].VpcID" | tr -d '"'
    sleep 1
done
