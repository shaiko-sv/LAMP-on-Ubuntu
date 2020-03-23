# Install unzip
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install unzip
sudo apt install php-mysql php-mbstring php-tokenizer php-xml php-json php-common
# Install installer for Composer
# System Requirements
# Composer requires PHP 5.3.2+ to run.
wget https://getcomposer.org/installer
# execute installer
php installer
# you must see something like this
# All settings correct for using Composer
# Downloading...
#
# Composer (version 1.10.1) successfully installed to: /home/user/composer.phar
# Use it: php composer.phar

# For global installation
# check if path
echo $PATH
sudo mv composer.phar /usr/local/bin/composer
# run composer
composer
composer init
# First, download the Laravel installer using Composer
composer global require laravel/installer
# Open file
sudo nano ~/.bashrc
# Add two lines
# PATH=$PATH:$HOME/.config/composer/vendor/bin
# export PATH
# Exit and enter again
# Change directory to site
cd /var/www/
# Launch installation of new project
laravel new blog "5.8.*" # Not shure if version will work, by default install latest vertsion
# Token
# or
composer create-project --prefer-dist laravel/laravel laravelGoogle "5.8.*"
# Configurate rights for www-data
# To see al users in system
# vipw
# exit :q
sudo chown -R www-data:www-data laravelGoogle
# Configurate database
sudo mysql -u root -p
# Create database laravel
# > CREATE DATABASE laravel;
# Create user and giv him rights
# > CREATE USER `laravel`@`localhost` IDENTIFIED BY 'password';
# > GRANT ALL ON laravel.* TO `laravel`@`localhost`;
# Reload privilegues
# > FLUSH PRIVILEGES;
# Cofigurate config/database.php
sudo nano config/database.php
# Create virtual host in Apache
sudo nano /etc/apache2/sites-available/laravelapp.conf
#  <VirtualHost *:80>
#  ServerName laravel.mk
#  ServerAdmin webmaster@localhost
#  DocumentRoot /var/www/laravelGoogle/public
#          <Directory "/var/www/laravelGoogle/public">
#                  Options FollowSymLinks
#                  AllowOverride All
#                  Order allow,deny
#                  Allow from all
#          </Directory>
#  ErrorLog ${APACHE_LOG_DIR}/error.log
#  CustomLog ${APACHE_LOG_DIR}/access.log combined
#  </VirtualHost>
# Activate site in Apache
sudo a2ensite laravelGoogle
# Restart Apache
sudo systemctl restart apache2
# On your computer make changes in hosts
sudo nano /etc/hosts
# 35.198.110.254 laravel.mk
# НАСТРОЙКА APACHE
# Для обработки запросов будет использоваться модуль mpm_prefork, так как он совместим с большинством систем. Поэтому его нужно активировать, а mpm_event и mpm_worker отключить:
sudo a2dismod mpm_event
sudo a2dismod mpm_worker
sudo a2enmod mpm_prefork
# Включаем mod_rewrite, который сейчас используется практически везде:
sudo a2enmod rewrite
# Если вы хотите использовать файлы httaccess для настроек, то необходимо в файле /etc/apache2/apache2.conf изменить значение AllowOverride с None на All для нужных местоположений, например, для /var/www:
sudo nano /etc/apache2/apache2.conf
# <Directory /var/www/laravelGoogle>
#   Options Indexes FollowSymLinks
#   AllowOverride All
#   Require all granted
# </Directory>
# Далее необходимо перезапустить Apache:
sudo systemctl restart apache2
# НАСТРОЙКА PHP
# По умолчанию короткие теги, обрамляющие скрипты PHP, отключены.
# Это может привести к тому, что некоторые скрипты, использующие
# эти теги, могут не выполнятся. Для включения этой возможности откройте файл:
sudo nano /etc/php/7.2/apache2/php.ini
# line 192 short_open_tag = On
# line 457 error_reporting = E_ALL
# line 474 display_errors = On
# line 581 error_log = php-errors.log

# Main source is https://losst.ru/ustanovka-lamp-ubuntu-18-04