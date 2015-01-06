#!/bin/bash -e

cd ansible
ansible-playbook ots-service-docker-image-builder.yml -i docker -vvvv

