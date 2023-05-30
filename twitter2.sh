#!/bin/bash

admin_pass='password'

useradd -m -d /home/twitter_user -s /bin/bash -p twitter_pass twitter_user

export DEBIAN_FRONTEND=noninteractive

echo "root:$admin_pass" | chpasswd

apt update -y
apt -y upgrade

apt install -y apache2 mysql-server php php-mysql php-gd php-curl \
php-zip libapache2-mod-php phpmyadmin git

ufw allow in "Apache full"

#mysql -u src1 -p 12345 -e "update mysql.user set plugin = 'mysql_native_password' where User='root'"
#mysql -u src1 -p 12345 -e "ALTER USER 'root'@'localhost' IDENTIFED WITH mysql_native_password BY '$admin_pass'"
#mysql -u src1 -p 12345 -e "FLUSH PRIVILEGES"
#mysql -u src1 -p 12345 -e "CREATE DATABASE twitter"

DOCROOT='/var/www/'
#mkdir $DOCROOT
cd $DOCROOT
git clone https://github.com/Adamapb/twitterclone2.git
mkdir html
cp -R twitterclone2/* html
cd html

cat > /etc/apache2/mods-enabled/dir.conf <<"__EOF__"
<IfModule mod_dir.c>
	DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htmsudo 
</IfModule>
# vim syntax=apache ts=4 sw=4 sts=4 sr noet
__EOF__

mysql -u root -e "CREATE DATABASE twitter;"
mysql -u root -e "CREATE USER 'src1'@'%' IDENTIFIED BY '12345';"
mysql -u root -e "GRANT ALL ON *.* TO 'src1'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"


#APACHE='/etc/apache2/sites-available'
#cp $APACHE/000-default.conf $APACHE/000-default.conf.bak
#rm $APACHE/000-default.conf
#cd $APACHE

#cat > 000-default.conf <<"__EOF__"
#<VirtualHost *:80>
#	ServerAdmin webmaster@localhost
#	DocumentRoot /var/www/html
#
#	<Directory /var/ww/html>
#		Options Indexes FollowSymLinks MultiViews
#		AllowOverride All
#		Order allow,deny
#		allow from all
#	</Directory>
#
#	ErrorLog ${APACHE_LOG_DIR}/error.log
#	CustomLog ${APACHE_LOG_DIR}/access.log combined
#</VirtualHost>
#__EOF__

service apache2 restart

mysql -usrc1 -p12345 twitter < twitter4.sql

cat > /var/www/html/core/database/connection.php <<"__EOF__"
<?php
$servername = "localhost";
$db_name = "twitter";
$username = "src1";
$password = "12345";
__EOF__


cat > /var/www/html/core/init.php <<"__EOF__"
<?php

include 'classes/connection.php' ;
include 'classes/User.php' ;
include 'classes/Follow.php' ;
include 'classes/Tweet.php' ;

session_start();

global $pdo;

define("BASE_URL" , "http://localhost/twitter/");
__EOF__


cat > /etc/mysql/mysql.conf.d/mysqld.cnf <<"__EOF__"
[mysqld]

user = mysql

bind-address = *
mysqlx-bind-address	= 127.0.0.1

key_buffer_size	= 16M

myisam-recover-options = BACKUP

log_error = /var/log/mysql/error.log

max_binlog_size	= 100M
__EOF__

cat > /var/www/html/core/classes/connection.php <<"__EOF__"
<?php

// try for connect with class

class Connect {
    protected static $servername = "localhost";
    protected static $db_name="twitter";
    protected static $username = "src1";
    protected static $password = "12345";
    protected static $pdo;
    public function __construct() { }

      // this is try to use self function in connect to make login easier with :: operator

    public static function connect() {
         $servername =self::$servername;
         $db_name = self::$db_name;
        try {
            $conn = new PDO("mysql:host=$servername;dbname=$db_name", self::$username, self::$password);
            // set the PDO error mode to exception
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
          //   echo "Connected successfully";
            } catch(PDOException $e) {
            echo "Connection failed: " . $e->getMessage();
            }
        
            return $conn;
    }

}
__EOF__

#cat /etc/mysql/mysql.conf.d/mysql.cnf <<"__EOF__"
#[mysql]
#__EOF__

#cat /etc/mysql/my.cnf <<"__EOF__"
#!includedir /etc/mysql/conf.d/
#!includedir /etc/mysql/mysql.conf.d/
#__EOF__

#cat /etc/mysql/conf.d/mysqldump.cnf <<"__EOF__"
#[mysqldump]
#quick
#quote-names
#max_allowed_packet	= 16M
#__EOF__


service apache2 restart

service mysql restart

PUBLIC_IP="http://$(ip route get 8.8.8.8 | awk '{print $7}' | tr -d "\n")"

#curl $PUBLIC_IP/installation/?page=installed


echo "INSTALL COMPLETE"


#reboot
