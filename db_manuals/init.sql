-- init.sql

GRANT ALL PRIVILEGES ON DATABASE serviceindex1 TO serviceindex_django;
CREATE SCHEMA IF NOT EXISTS serviceindex AUTHORIZATION serviceindex_django;
