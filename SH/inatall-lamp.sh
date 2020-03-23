#!/bin/bash
# Update Package Index
sudo apt-get update
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
sudo chmod -R 0755 /var/www/html/
# Create info.php for testing php processing
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php