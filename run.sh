#!/bin/bash


# Set Web2py Admin Password
cd /usr/local/web2py
if [ ! $PASSWORD ]
  then export PASSWORD="changeme"
fi
python -c "from gluon.main import save_password; save_password('$PASSWORD',443)"
ln -s parameters_443.py parameters_80.py
chown www-data.www-data parameters_*.py

nginx
uwsgi --master --die-on-term --emperor /etc/uwsgi --logto /var/log/uwsgi/uwsgi.log &

tail -f /var/log/nginx/access.log /var/log/nginx/error.log /var/log/uwsgi/uwsgi.log
