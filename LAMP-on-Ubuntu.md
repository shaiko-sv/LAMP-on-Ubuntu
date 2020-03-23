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
  https://help.ubuntu.ru/wiki/руководство_по_ubuntu_server/приложения_lamp/phpmyadmin

    sudo add-apt-repository ppa:phpmyadmin/ppa
    sudo apt-get update
    sudo apt-get install phpmyadmin
    sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
    sudo a2enconf phpmyadmin
    sudo /etc/init.d/apache2 reload
  
    если не запускается, то
    sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf
    sudo /etc/init.d/apache2 restart
    
    Ограничить видимость для интернета
      в файл /etc/apache2/conf-enabled/phpmyadmin.conf под строчкой
        <Directory /usr/share/phpmyadmin> 
          добавить
        Deny from all
        Allow from 127.0.0.1 109.172.13.224 192.168.1.
      
9. Check if apache, php, mysql and phpmysql work good:
  ip.address - will show apache page
  ip.address/info.php - will show php server information
  is.address/phpmyadmin - will show page to database connection
    after indicate login and password you must connect to your mysql
    
10. Solving problew with ftp
  https://www.thearyanews.com/google-cloud/solved-how-to-fix-sftp-permission-errors-on-google-cloud/

11. Instruction how to use GitHub https://www.dmosk.ru/miniinstruktions.php?mini=github-linux-use
