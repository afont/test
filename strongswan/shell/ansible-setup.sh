#!/bin/bash

apt install ansible python-pip sshpass -y

cd /home/vagrant/provision
ansible-playbook playbooks/main.yml
