#!/bin/bash

if [ ! $PASSWORD ]
  then export PASSWORD="changeme"
fi

cd /usr/local/web2py/
su - www-data -s /bin/bash -c "cd /usr/local/web2py/ && python web2py.py -a $PASSWORD"
