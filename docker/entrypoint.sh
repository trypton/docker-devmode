#!/bin/bash

# MySQL setup
if [ -z "$(ls /var/lib/mysql)" ]; then
    mysqld --initialize-insecure
    mysqld_safe &
    mysqladmin --silent --wait=30 ping || exit 1
    mysql -uroot -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'
    mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION; FLUSH PRIVILEGES;"
    mysqladmin -uroot shutdown
fi

mysqld_safe --daemonize
apache2ctl -D FOREGROUND
