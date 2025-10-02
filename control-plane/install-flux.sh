#!/bin/bash

#install flux
sudo curl -s https://fluxcd.io/install.sh | sudo bash

#create kube config
sudo cp /etc/rancher/k3s/k3s.yaml .kube/config

#bootstrap flux
flux bootstrap github --owner=nleahy --repository=pi-cluster --branch=main --path=./clusters/staging --personal