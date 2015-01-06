#!/bin/bash

cd ansible
ansible-playbook ots-service-container.yml -i docker -vvvv

