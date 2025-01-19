#!/bin/bash
set -ex


# Activate Pipenv shell and run Django commands
pipenv install -v

pipenv run python /conf/app_config.py

# sleep 1
pipenv run python /Operations_ServiceIndex_Django/Operations_ServiceIndex_Django/manage.py makemigrations
sleep 1
pipenv run python /Operations_ServiceIndex_Django/Operations_ServiceIndex_Django/manage.py migrate
 sleep 1
# pipenv run python /Operations_ServiceIndex_Django/Operations_ServiceIndex_Django/manage.py createsuperuser --username serviceindex_django --email jelambe@iu.edu --noinput
# sleep 3
pipenv run python /Operations_ServiceIndex_Django/Operations_ServiceIndex_Django/manage.py collectstatic --no-input
sleep 1

# Run the Django server
pipenv run python /Operations_ServiceIndex_Django/Operations_ServiceIndex_Django/manage.py runserver 0.0.0.0:8000
# pipenv run python /Operations_ServiceIndex_Django/Operations_ServiceIndex_Django/manage.py runserver_plus --cert-file cert.pem --key-file key.pem

cat /conf/serviceindex.json