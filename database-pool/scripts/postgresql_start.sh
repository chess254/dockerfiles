#!/usr/bin/env sh

service postgresql start > /dev/null 2>&1

su - postgres << EOF
echo -e "create user test;\ncreate database ri_db;\ngrant all privileges on ri_db to test;\n" > create_user.sql
psql postgres< create_user.sql > /dev/null 2>&1

EOF
