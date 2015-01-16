#!/bin/bash

cd ansible
ansible-playbook ots-service-container.yml -i $1.py -vvvv --extra-vars="env=$1, ots_service_tag=$2"

