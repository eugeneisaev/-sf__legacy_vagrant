#!/bin/bash

wget https://www.postgresql.org/media/keys/ACCC4CF8.asc
sudo apt-key add ACCC4CF8.asc

sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main 
8.4" >> /etc/apt/sources.list.d/pgdg.list

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -qq postgresql-8.4 
postgresql-client-8.4 postgresql-contrib-8.4 < /dev/null > /dev/null

sudo -u postgres psql postgres -c "ALTER USER postgres WITH ENCRYPTED 
PASSWORD 'postgres'"

sudo -u postgres psql postgres -c "CREATE USER vagrant_user WITH ENCRYPTED 
PASSWORD 'vagrant_user'"
sudo -u postgres psql postgres -c "CREATE DATABASE vagrant OWNER 
vagrant_user"

sudo echo "listen_addresses = '*'" >> 
/etc/postgresql/8.4/main/postgresql.conf
sudo echo "logging_collector = on" >> 
/etc/postgresql/8.4/main/postgresql.conf

sudo service postgresql restart
