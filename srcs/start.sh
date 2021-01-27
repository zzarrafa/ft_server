chown -R mysql: /var/lib/mysql
service mysql start
service nginx start
service php7.3-fpm start