#!/bin/bash

# linux kvm

egrep -c '(vmx|svm)' /proc/cpuinfo
sudo apt install cpu-checker
ok=$(sudo kvm-ok)
echo "$ok"
dkh start
sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
sudo systemctl status libvirtd
sudo systemctl enable --now libvirtd
sudo systemctl status libvirtd
look=$(lsmod | grep -i kvm)
echo "look"

