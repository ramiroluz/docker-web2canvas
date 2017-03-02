#!/bin/bash

nginx
uwsgi --master --die-on-term --emperor /etc/uwsgi --logto /var/log/uwsgi/uwsgi.log &

tail -f /var/log/nginx/access.log /var/log/nginx/error.log /var/log/uwsgi/uwsgi.log
