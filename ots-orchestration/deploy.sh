#!/bin/bash

cd ansible
ansible-playbook -i $1.py ots-service.yml -vv

