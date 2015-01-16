#!/bin/bash -e

echo $1 $2
cd ansible
ansible-playbook ots-service-image.yml -i $1.py -vvvv --extra-vars="ots_service_tag=$2"

