#!/bin/bash

#install vim
sudo apt install vim

#update cdmline.txt to include cgroup
sudo sed -i '$s/$/ cgroup_memory=1 cgroup_enable=memory/' /boot/firmware/cmdline.txt


NODE_TOKEN=$(cat -- "/var/lib/rancher/k3s/server/node-token")
export NODE_TOKEN


SERVER_IP==$(cat -- "~/.kube/ip.txt")
export SERVER_IP


#install k3s
sudo su -

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable=helm-controller" K3S_URL=https://$SERVER_IP:6443 K3S_TOKEN=$NODE_TOKEN sh -

sudo systemctl status k3s.service
