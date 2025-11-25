#!/bin/bash

#install flux
sudo curl -s https://fluxcd.io/install.sh | sudo bash

#create kube config
sudo cp /etc/rancher/k3s/k3s.yaml .kube/config

#environment variables
export GITHUB_USER=nleahy
export REPOSITORY=pi-cluster
export BRANCH=main
export PATH=./clusters/staging

#bootstrap flux
flux bootstrap github --owner=$GITHUB_USER --repository=$REPOSITORY --branch=$BRANCH --path=$PATH --personal
