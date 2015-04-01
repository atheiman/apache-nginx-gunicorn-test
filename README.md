# The Fabled (convoluted) **Double Reverse Proxy**

Apache -> Nginx -> Gunicorn. Three different domains. Three different headaches.
Add in SSL and auth and you have a recipe for disaster.

1. Requests go to a domain served by apache
1. Requests are proxied to a domain served by nginx
1. Requests are proxied to gunicorn app server
1. Django interprets the request, and sends it back up the chain

apache running at `apachedomain.com:8000`
nginx running at `nginxdomain.com:80`
gunicorn running at `127.0.0.1:9000`


## Quickstart (join us in hell)

```shell
$ git clone https://gist.github.com/e7b8bec6f67689d61c1c.git

$ vagrant ssh

$ curl apachedomain.com:8000/my-url
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
