#!/bin/bash
set -e

# Create user and database first
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER serviceindex_django WITH PASSWORD 'Bbfsjrvneru&fg';
    CREATE DATABASE serviceindex1 OWNER serviceindex_django;
    GRANT ALL PRIVILEGES ON DATABASE serviceindex1 TO serviceindex_django;
EOSQL

# Create schemas
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "serviceindex1" <<-EOSQL
    CREATE SCHEMA IF NOT EXISTS serviceindex;
    CREATE SCHEMA IF NOT EXISTS django;
    GRANT ALL ON SCHEMA serviceindex TO serviceindex_django;
    GRANT ALL ON SCHEMA django TO serviceindex_django;
    ALTER DATABASE serviceindex1 SET search_path TO serviceindex,django,public;
EOSQL


# Then restore the dump (if it exists and creates the schemas)
# if [ -f /docker-entrypoint-initdb.d/django.dump.1719417916copy.sql ]; then
#     PGPASSWORD='Bbfsjrvneru&fg' psql -U serviceindex_django -d serviceindex1 -f /docker-entrypoint-initdb.d/django.dump.1719417916copy.sql
# fi
