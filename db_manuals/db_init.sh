#!/bin/bash
set -e

PGPASSWORD='Bbfsjrvneru&fg' psql -U serviceindex_django -d serviceindex1 -f /docker-entrypoint-initdb.d/django.dump.1719417916copy.sql