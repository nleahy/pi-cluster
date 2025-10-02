#!/bin/bash

#share the node token the ip
#expected argument username@ipaddress of the node being bootstrapped
scp /var/lib/rancher/k3s/server/node-token $1:/var/lib/rancher/k3s/server/node-token


#share controlplane ip during copy for bootstrapping nodes
ip addr show wlan0 | grep -oP 'inet \K[\d.]+' > ip.txt

scp ip.txt $1:~/.kube/ip.txt

rm ip.txt