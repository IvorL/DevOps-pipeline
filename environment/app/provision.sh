#!/bin/bash

# Update the sources list
sudo apt-get update -y

# Upgrade any packages available
sudo apt-get upgrade -y

# Install nginx
sudo apt-get install nginx -y

# Install git
sudo apt-get install git -y

# Install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash - # get request for the node source code, which is then run in bash
sudo apt-get install nodejs -y

# Install pm2 (process manager)
sudo npm install pm2 -g

# Remove the existing configuration file (if present) to avoid confilct with the link command below
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
sudo rm /etc/nginx/conf.d/app.conf
# link the configuration file to nginx
sudo ln -s /home/ubuntu/environment/app/app.conf /etc/nginx/conf.d/app.conf

# Reload Nginx so that the configuration takes effect
sudo nginx -s reload
# echo "export DB_HOST=192.168.10.101" >> ~/.bashrc

# source ~/.bashrc
