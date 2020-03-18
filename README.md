# LAMP-on-Ubuntu
LAMP on Ubuntu 19.10 - Google Compute Engine
This repository was made to keep all commands to install LAMP on Ubuntu 19.10
1. Create directory sh
  mkdir sh
2. Open install-lamp with nano
  nano sh/install-lamp.sh
3. Copy all commands form this repository
4. Make install-lamp.sh executable
  chmod -R 0755 sh/install-lamp.sh
5. Execute install-lamp.sh file for LAMP installing on Ubuntu 19.10
  ./sh/install-lamp.sh
6. In Compute Engine consol permit HTTP and HTTPS traffic to have access to your web-server
7. Configurate MySQL
  https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04
8. Configurate PHPMyAdmin
  https://www.digitalocean.com/community/tutorials/phpmyadmin-ubuntu-16-04-ru
9. Check if apache, php, mysql and phpmysql work good:
  ip.address - will show apache page
  ip.address/info.php - will show php server information
  is.address/phpmyadmin - will show page to database connection
    after indicate login and password you must connect to your mysql
