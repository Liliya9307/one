#!/bin/bash

apt update
apt install -y nfs-common
mkdir -p /var/nfs/keys

while [ ! -f /var/nfs/keys/id_rsa ]; do
  mount 192.168.1.1:/var/nfs/keys /var/nfs/keys
  sleep 10
done

cp /var/nfs/keys/id_rsa* /users/liliya93/.ssh/
chown liliya93: /users/liliya93/.ssh/id_rsa*
runuser -u liliya93 -- cat /users/liliya93/.ssh/id_rsa.pub >> /users/liliya93/.ssh/authorized_keys
