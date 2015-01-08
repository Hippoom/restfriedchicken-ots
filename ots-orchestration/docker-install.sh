#!/bin/bash -e

cd ansible
ansible-playbook ots-service-image.yml -i $1.py -vvvv

