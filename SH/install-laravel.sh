#
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
# First, download the Laravel installer using Composer
composer global require laravel/installer