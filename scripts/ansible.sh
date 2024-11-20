#!/bin/bash
#source: https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-debian-11

sudo apt update  
sudo apt install software-properties-common  
sudo add-apt-repository --yes --update ppa:ansible/ansible  
sudo apt install ansible -y
