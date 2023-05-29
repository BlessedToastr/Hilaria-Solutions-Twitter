#!/bin/bash

if [ "$EUID" -ne 0 ]
then 
	echo "run as root dumbass"
	exit
fi

admin_password='password'
useradd -m -d /home/twitter_user -s /bin/bash -p twitter_pass twitter_user

export DEBIAN_FRONTEND=noninteractive

echo "root:$admin_password" | chpasswd

apt update
apt upgrade -y

apt install -y apache2 mysql-server php php-mysql php-gd php-curl \
	php-zip libapache2-mod-php phpmyadmin git

ufw allow in "Apache full"

DOCRoot='/var/www'
cd $DOCRoot
git clone https://github.com/BlessedToastr/Hilaria-Solutions-Twitter.git

mkdir html
cp -R Hilaria-Solutions-Twitter/html/* html/
cd html

cat > /etc/apache2/mods-enabled/dir.conf <<"__EOF__"
<IfModule mod_dir.c>
	DirectoryIndex index.php index.cgi index.pl index.html index.xhtml index.htmsudo 
</IfModule>
# vim syntax=apache ts=4 sw=4 sts=4 sr noet
__EOF__

mysql -u root -e "CREATE DATABASE twitter;"
mysql -u root -e "CREATE USER 'ncrc'@'%' IDENTIFIED BY 'P455w0rd!';"
mysql -u root -e "GRANT ALL ON *.* TO 'ncrc'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

service apache2 restart

mysql -uncrc -pP455w0rd! twitter < twitter.sql
mysql -uncrc -pP455w0rd! twitter < users.sql
mysql -uncrc -pP455w0rd! twitter < posts.sql
mysql -uncrc -pP455w0rd! twitter < tweets.sql

cat > /var/www/html/core/database/connection.php <<"__EOF__"
<?php
$servername = "localhost";
$db_name = "twitter";
$username = "ncrc";
$password = "P455w0rd!";
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
    protected static $username = "ncrc";
    protected static $password = "P455w0rd!";
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

service apache2 restart
service mysql restart

echo "Install Complete"
echo "MySQL Creds: ncrc:P455w0rd!"

reboot
