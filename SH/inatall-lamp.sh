#!/bin/bash
# Ubuntu-Bionic 18.04 on Google Comute Engine n1-standard-1 (1 virtual CPU, 3,75 Gb mymory)
# Update Package Index
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y
# Install Apache2, MySQL, PHP
sudo apt-get install -y apache2 mysql-server php php-mysql libapache2-mod-php php-cli
# Allow to run Apache on boot up
sudo systemctl enable apache2
# Restart Apache Web Server
sudo systemctl start apache2
# настройка mysql
sudo mysql_secure_installation
# Install phpMyAdmin and it's prerequisites
sudo add-apt-repository ppa:phpmyadmin/ppa
sudo apt-get update
sudo apt-get install -y phpmyadmin php-mbstring php-gettext
# настройку apache для обеспечения работы phpMyAdmin
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin
sudo /etc/init.d/apache2 reload
# в случае ошибки
sudo  mkdir /etc/apache2/conf.d
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf
sudo /etc/init.d/apache2 restart
# Make PhpMyAdmin more safty
sudo nano /etc/apache2/conf-available/phpmyadmin.conf
#  <Directory /usr/share/phpmyadmin>
#      Options FollowSymLinks
#      DirectoryIndex index.php
#      AllowOverride All <---- add this line
# Add this if you want allow only some IP address
#      order deny,allow
#      deny from all
#      allow from 127.0.0.1
#      allow from 192.168.1.0/15
#      allow from 92.53.45.
#      . . .
# Reload Apache
sudo systemctl restart apache2
# Create .htaccess for phpmyadmin
sudo nano /usr/share/phpmyadmin/.htaccess
#  AuthType Basic
#  AuthName "Restricted Files"
#  AuthUserFile /etc/phpmyadmin/.htpasswd
#  Require valid-user
# install additional utilites for .htpasswd
sudo apt-get install apache2-utils
# Create first user
sudo htpasswd -c /etc/phpmyadmin/.htpasswd admin
# Для добавления нового пользователя выполните следующую команду без флага -c:
sudo htpasswd /etc/phpmyadmin/.htpasswd phpmyadmin
# php-mcrypt Installation
# Install prerequisites
sudo apt-get install php-dev libmcrypt-dev gcc make autoconf libc-dev pkg-config
# Compile mcrypt extension
sudo pecl install mcrypt-1.0.1
# Just press enter when it asks about libmcrypt prefix
# Enable extension for apache
echo "extension=mcrypt.so" | sudo tee -a /etc/php/7.2/apache2/conf.d/mcrypt.ini
# Restart apache
sudo service apache2 restart
# Enable required extensions:
sudo phpenmod mcrypt
sudo phpenmod mbstring
# Restart Apache server:
sudo systemctl restart apache2
# Adjust Firewall
sudo ufw allow in "Apache Full"
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow mysql
sudo ufw enable
# Allow Read/Write for Owner
sudo chmod -R 0777 /var/www/html/
# Create info.php for testing php processing
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php