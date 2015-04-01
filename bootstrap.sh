#!/usr/bin/env bash

SYNCED_FOLDER=/vagrant
APACHE_CONF_DIR=/etc/apache2
DOC_ROOT=/var/www
APACHE_VHOST_CONF=$SYNCED_FOLDER/apachedomain.com.conf
NGINX_CONF_DIR=/etc/nginx
NGINX_VHOST_CONF=nginx-vhost
NGINX_DOCS_DIR=$SYNCED_FOLDER/nginxdomain.com
NGINX_DOC_ROOT=/var/nginxdomain.com

# apachedomain.com and nginxdomain.com
cp -f $SYNCED_FOLDER/hosts /etc/hosts

apt-get update
apt-get install -y apache2 nginx python-pip


service apache2 stop
service nginx stop


a2dissite 000-default.conf
a2enmod rewrite
a2enmod proxy
a2enmod proxy_http
cp $APACHE_VHOST_CONF $APACHE_CONF_DIR/sites-available/
cp $SYNCED_FOLDER/ports.conf $APACHE_CONF_DIR/
a2ensite apachedomain.com.conf

service apache2 start


rm $NGINX_CONF_DIR/sites-enabled/*
cp $SYNCED_FOLDER/$NGINX_VHOST_CONF $NGINX_CONF_DIR/sites-available/
ln -s $NGINX_CONF_DIR/sites-available/$NGINX_VHOST_CONF $NGINX_CONF_DIR/sites-enabled/
cp -r $NGINX_DOCS_DIR $NGINX_DOC_ROOT

service nginx start


pip install gunicorn django
