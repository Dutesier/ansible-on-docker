#!/bin/bash
ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y

mkdir -p /etc/ansible
touch /etc/vimrc_config
echo "[containers]" >> /etc/ansible/hosts

echo "[defaults]" >> /etc/ansible/ansible.cfg
echo "host_key_checking = False" >> /etc/ansible/ansible.cfg

