#!/usr/bin/env sh

if [ -z $DB_POOL_HOST ] || [ -z $DB_POOL_PORT ]; then
    echo "Database Pool is not enabled"
    exit 1
else
    curl --no-progress-meter -XPOST "http://$DB_POOL_HOST:$DB_POOL_PORT/mssql/start"
fi
