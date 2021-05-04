#!/usr/bin/env sh

curl --no-progress-meter -XPOST "http://$DB_POOL_HOST:$DB_POOL_PORT/mysql/start"
