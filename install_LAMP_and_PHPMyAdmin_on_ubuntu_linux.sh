#!/bin/bash
# ***************************************************************
# Program: Install (L)AMP Stack and PHPMyAdmin on Ubuntu/Debian
# Author: skpaul82 <hello@skpaul.me>
# Date: 04-06-2018
# 
# =======================================================
# 
# How to run this AMP and phpMyAdmin installation script?
#  1 open the terminal (Ctrl+Alt+T)
#  2 And type/copy-paste following 4 lines of commands
#	cd ~
#	wget https://raw.githubusercontent.com/skpaul82/DevOps_Life_Automation/master/install_LAMP_and_PHPMyAdmin_on_ubuntu_linux.sh
#	chmod -x ./install_LAMP_and_PHPMyAdmin_on_ubuntu_linux.sh
#	bash ./install_LAMP_and_PHPMyAdmin_on_ubuntu_linux.sh
#
# ***************************************************************

# Colors for notification and pregress text info
Color_Reset='\033[0m'	#Text color reset
Red='\033[0;31m'		# Red
Green='\033[0;32m'		# Green
Yellow='\033[0;33m'		# Yellow
Purple='\033[0;35m'		# Purple
Cyan='\033[0;36m'		# Cyan



# Updating system
echo -e "$Cyan \n Updating System.. $Color_Reset"
sudo apt-get update
echo -e "$Green \n System has been successfully updated. $Color_Reset"


echo -e "$Yellow \n Starting AMP installation.. $Color_Reset"

# install apache2
echo -e "$Cyan \n Installing apache2.. $Color_Reset"
sudo apt-get install apache2 apache2-utils
echo -e "$Purple \n Setting apache2 auto start on start.. $Color_Reset"
# auto start on restart
sudo ctl enable apache2
echo -e "$Purple \n Starting apache2 server.. $Color_Reset"
# start apache server
sudo systemctl start apache2
echo -e "$Green \n Apache2 Server has been successfully installed. $Color_Reset"

# install mysql
echo -e "$Cyan \n Installing MySQL.. $Color_Reset"
sudo apt-get install mysql-client mysql-server
# secure mysql installation from nativ mode
echo -e "$Purple \n Securing MySQL installation from nativ mode.. $Color_Reset"
sudo mysql_secure_installation
echo -e "$Green \n MySQL has been successfully installed. $Color_Reset"


echo -e "$Cyan \n Installing php7.0 and modules .. $Color_Reset"
# install php7.0
sudo apt-get install php7.0 php7.0-mysql libapache2-mod-php7.0 php7.0-cli php7.0-cgi php7.0-gd
echo -e "$Green \n PHP7.0 and modules has been successfully installed. $Color_Reset"

echo -e "$Yellow \n AMP installation DONE. $Color_Reset"


echo -e "$Cyan \n Creating a test file for testing installation in /var/www/html/ location.. $Color_Reset"
#verify LAMP stack, create a test file and check on browser
sudo printf "<?php\necho 'Hellooooo.. world<br>';\nphpinfo();\n?>" > /var/www/html/test.php;
#sudo printf "<?php\nphpinfo();\n?>" > /var/www/html/info.php;
echo -e "$Green \n test.php file created successfully, Please check on browser. $Color_Reset"


echo -e "$Cyan \n Now Installing PHPMyAdmin.. $Color_Reset"
# install phpmyadmin
sudo apt-get install phpmyadmin
#select server - apache2
echo -e "$Green \n PHPMyAdmin has been successfully installed. $Color_Reset"


echo -e "$Cyan \n Restarting Apache Server.. $Color_Reset"
# restart apache2 server
sudo service apache2 restart
#or
#sudo /etc/init.d/apache2 restart
echo -e "$Green \n Everything is successfully completed. Now check browser. $Color_Reset"
echo -e "$Red \n Thank You for using this script, Please share this script with your friends too  - skpaul82 :). $Color_Reset"
