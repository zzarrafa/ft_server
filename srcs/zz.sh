wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb
apt update && apt upgrade -y 
apt install -y lsb-release
apt update && apt upgrade -y 
apt install  -y gnupg
apt install -y dpkg
dpkg -i mysql-apt-config*
apt update && apt upgrade -y
apt install  -y mysql-server

cp /tmp/default /etc/nginx/sites-enabled/default
cp /tmp/php.ini /etc/php/7.3/fpm/php.ini

wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.zip
unzip phpMyAdmin-4.9.2-all-languages
mv phpMyAdmin-4.9.2-all-languages var/www/html/phpmyadmin
wget https://wordpress.org/latest.zip
unzip latest.zip
mv wordpress/* /var/www/html/
cp /tmp/wp-config.php /var/www/html/
chown -R mysql: /var/lib/mysql
service mysql start


mysql  -e "CREATE DATABASE wordpress; USE wordpress; source /tmp/wordpress.sql;"
mysql  -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY '123'; "
mysql  -e "GRANT ALL ON wordpress.* TO 'admin'@'localhost';"
mysql  -e "FLUSH PRIVILEGES;"