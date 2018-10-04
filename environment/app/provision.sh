#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - # get request for the node source code, which is then run in bash
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

# link the app.conf file to nginx
sudo ln -s /home/ubuntu/environment/app.conf /etc/nginx/conf.d/app.conf
sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled
sudo nginx -s reload
# echo "export DB_HOST=192.168.10.101" >> ~/.bashrc

# source ~/.bashrc
