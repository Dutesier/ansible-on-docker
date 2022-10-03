#!/bin/bash

# Docker images
docker build manager/ -t ansible_manager_test 
docker build nodes/ -t ansible_test

# Docker network
docker network create Ansible_net

# Ansible Manager
docker run --network=Ansible_net -d --name=ansible_manager ansible_manager_test

# Get Ansible Manager id_rsa.pub
IDRSA=$(docker exec ansible_manager cat /root/.ssh/id_rsa.pub)

# Ansible Nodes
for i in {1..5}; do
    docker run -d --network=Ansible_net --name=ansible$i ansible_test
done


# Add manager ssh key to all nodes
for i in {1..5}; do
    docker exec ansible$i bash -c "echo $IDRSA >> /root/.ssh/authorized_keys"
    # docker exec ansible$i cat /root/.ssh/authorized_keys
    docker exec ansible_manager bash -c "echo ansible$i >> /etc/ansible/hosts"
done

# D
# docker exec ansible_manager cat /etc/ansible/hosts

# Run playbook
docker exec ansible_manager bash -c "ansible-playbook install_all_the_editors.yml"

for i in {1..5}; do
    docker stop ansible$i
    docker rm ansible$i
done

docker stop ansible_manager
docker rm ansible_manager
docker network rm Ansible_net