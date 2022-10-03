#!/bin/bash

mkdir -p /root/.ssh
touch /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
chmod o+r /etc/resolv.conf

service ssh start

tail -f /dev/null
