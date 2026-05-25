# What to look at?

`./queries.sql` contains the query code;
`./main.up.sql` contains the table creation code;
`./main.down.sql` contains the table deletion code;
`./populate.sql` inserts example values into the database.

# How to use

Set the following environment variables:
```
PGPASSWORD=...
DBNAME=...
DBUSER=...
DBHOST=...
DBPORT=...
```
After the variables are set, one can proceed to use the recipes in the `justfile`.
To create all tables, one would
```bash
psql -f ./main.up.sql -d $DBNAME --username=$DBUSER --host=$DBHOST --port=$DBPORT
```

To delete all the tables, one would
```bash
psql -f ./main.down.sql -d $DBNAME --username=$DBUSER --host=$DBHOST --port=$DBPORT
```

To populate the database with the example data, one would
```bash
psql -f ./populate.sql -d $DBNAME --username=$DBUSER --host=$DBHOST --port=$DBPORT
```

To execute the queries, one would
```bash
psql -f ./queries.sql -d $DBNAME --username=$DBUSER --host=$DBHOST --port=$DBPORT
```
