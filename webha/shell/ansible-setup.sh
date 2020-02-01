#!/bin/bash

apt install ansible -y

cd /home/vagrant/provision
ansible-playbook playbooks/environment.yml
