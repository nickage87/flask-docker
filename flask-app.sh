#!/bin/bash

case $1 in
        "boot") aws ec2 run-instances --image-id ami-10547475 --count 1 --instance-type t2.micro --key-name flask-app-key --security-group-ids sg-c5a908ad --subnet-id subnet-8677c4cb --user-data user_data.sh ;;
        "update") if echo $2 | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b";
                        then
                                ssh ubuntu@$ipaddress -i flask-app-key.pem update.sh 
                else
                        echo "Please verify your IP address!"
                fi
                ;;
        *) echo "No such option, Specify: 'boot' - to start an instance or 'update' - to update the running app." ;;
esac

