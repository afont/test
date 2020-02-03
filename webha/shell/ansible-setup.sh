#!/bin/bash

apt install ansible sshpass -y

cd /home/vagrant/provision
ansible-playbook playbooks/environment.yml
