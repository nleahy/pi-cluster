#!/bin/bash

#install vim
sudo apt install vim

#update cdmline.txt to include cgroup
sudo sed -i '$s/$/ cgroup_memory=1 cgroup_enable=memory/' /boot/firmware/cmdline.txt

#install k3s
sudo su -

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--cluster-init --disable=helm-controller" sh

sudo systemctl status k3s.service

sudo cp /etc/rancher/k3s/k3s.yaml .