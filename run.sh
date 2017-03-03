#!/bin/bash

# Get Web2py Admin Password
if [ "$nopassword" -eq 0 ]
then
  echo -e "Web2py Admin Password: \c "
  read -s PW
  printf "\n"  # fix no new line artifact of "read -s" to avoid cleartext password
fi

# Set Web2py Admin Password
cd /usr/local/web2py
if [ "$nopassword" -eq 0 ]
then
su - www-data python -c "from gluon.main import save_password; save_password('$PW',443)"
fi


nginx
uwsgi --master --die-on-term --emperor /etc/uwsgi --logto /var/log/uwsgi/uwsgi.log &

tail -f /var/log/nginx/access.log /var/log/nginx/error.log /var/log/uwsgi/uwsgi.log
