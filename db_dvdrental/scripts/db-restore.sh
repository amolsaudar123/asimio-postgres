#!/bin/bash

echo "Importing data into DB $DB_NAME"
pg_restore -U $POSTGRES_USER -d $DB_NAME /tmp/data/db_dvdrental/dvdrental.tar
echo "$DB_NAME DB restored from backup"

echo "Granting permissions in DB '$DB_NAME' to role '$DB_USER'."
psql -v ON_ERROR_STOP=on -U $POSTGRES_USER -d $DB_NAME <<-EOSQL
  GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO $DB_USER;
  GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO $DB_USER;
EOSQL
echo "Permissions granted"
