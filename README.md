# The Fabled (convoluted) **Double Reverse Proxy**

> **Apache -> Nginx -> Gunicorn.**<br/>
> **Three different URLs. Three different headaches.**<br/>
> **Add in SSL and auth and you have a recipe for disaster.**<br/>

1. Requests go to a domain served by apache
1. Requests are proxied to a domain served by nginx
1. Requests are proxied to gunicorn app server
1. Django interprets the request, and sends it back up the chain


apache running at `apachedomain.com:8000`

nginx running at `nginxdomain.com:80`

gunicorn running at `127.0.0.1:9000`


## Quickstart (join us in hell)

```shell
$ vagrant up && vagrant ssh

$ curl apachedomain.com:8000/req-to-apache    # Django should echo the url:
Django answers the call to http://nginxdomain.com/req-to-apache

$ curl nginxdomain.com/direct-to-nginx
Django answers the call to http://nginxdomain.com/direct-to-nginx

$ curl 127.0.0.1:9000/direct-to-gunicorn
Django answers the call to http://127.0.0.1:9000/direct-to-gunicorn
```


## Logs (find out what went wrong where)


### Apache

access log `/var/log/apache2/access.log`

error log `/var/log/apache2/error.log`


### Nginx

access log `/var/log/nginx/access.log`

error log `/var/log/nginx/error.log`


### Gunicorn

access log: `/tmp/gunicorn_access.log`

error log: `/tmp/gunicorn_error.log`
