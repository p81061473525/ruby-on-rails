#!/bin/bash
# centos7 安裝
# https://guides.rubyonrails.org/getting_started.html

# ruby
cd ~
command curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -
command curl -sSL https://rvm.io/pkuczynski.asc | sudo gpg2 --import -
source /etc/profile.d/rvm.sh
rvm install ruby
ruby -v

# sqlite3
cd ~
yum remove sqliete3
wget https://www.sqlite.org/2021/sqlite-autoconf-3360000.tar.gz --no-check-certificate
tar xvf sqlite-autoconf-3360000.tar.gz
cd sqlite-autoconf-3360000
./configure --prefix=/usr/local
make && make install

touch /etc/ld.so.conf.d/local.conf
echo "/usr/local/lib" >> /etc/ld.so.conf.d/local.conf
ldconfig
sqlite3 --version

# node.js
cd ~
wget https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz
tar xvf node-v16.13.0-linux-x64.tar.xz

VERSION=v16.13.0 >> ~/.profile
DISTRO=linux-x64 >> ~/.profile
export PATH=/root/node-$VERSION-$DISTRO/bin:$PATH >> ~/.profile
. ~/.profile

node -v

# Yarn 
cd ~
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
curl --silent --location https://rpm.nodesource.com/setup_12.x | sudo bash -
yum install yarn -y 
yarn -v 

# rails 
gem install rails
rails --version

# tester 
rails new blog
cd blog 
rails s -b 192.168.50.200
####
