# https://just.systems
set dotenv-load := true

default:
    just --list --list-submodules

up:
    psql -f ./main.up.sql -d $DBNAME --username=$DBUSER --host=$DBHOST --port=$DBPORT

down:
    psql -f ./main.down.sql -d $DBNAME --username=$DBUSER --host=$DBHOST --port=$DBPORT
