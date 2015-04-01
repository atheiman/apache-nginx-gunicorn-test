Testing a complex Django setup:

1. Requests go to a domain served by apache
1. Requests are proxied to a domain served by nginx
1. Static files are served, other files are proxied to gunicorn app server (running a simple django app)

apache running at apachedomain.com:8000
nginx running at nginxdomain.com:80
gunicorn running at 127.0.0.1:9000

should be able to interact with django app at apache domain.
