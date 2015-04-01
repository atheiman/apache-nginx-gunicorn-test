#!/usr/bin/env bash

SYNCED_FOLDER=/vagrant
APACHE_CONF_DIR=/etc/apache2
DOC_ROOT=/var/www

# apachedomain.com and nginxdomain.com
cp -f $SYNCED_FOLDER/hosts /etc/hosts

apt-get update
apt-get install -y apache2 nginx
a2dissite 000-default.conf
a2enmod rewrite
a2enmod proxy
cp $SYNCED_FOLDER/apache-host $APACHE_CONF_DIR/sites-available/apachedomain.com.conf
a2ensite apachedomain.com.conf

service apache2 restart
