#!/bin/bash

#install flux
curl -s https://fluxcd.io/install.sh | bash

#create kube config
mkdir .kube
sudo cp /etc/rancher/k3s/k3s.yaml .kube/config

#environment variables
export GITHUB_USER=nleahy
export REPOSITORY=pi-cluster
export BRANCH=main
export FLUXPATH=./clusters/staging

#bootstrap flux
flux bootstrap github --owner=$GITHUB_USER --repository=$REPOSITORY --branch=$BRANCH --path=$FLUXPATH --personal
