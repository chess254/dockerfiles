#!/usr/bin/env sh

# Allow remote connections
LINE='host  all  all 0.0.0.0/0 trust'
FILE='/etc/postgresql/13/main/pg_hba.conf'
grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
echo "listen_addresses = '*'" > /etc/postgresql/13/main/conf.d/my.conf

service postgresql start > /dev/null 2>&1

su - postgres << EOF
echo -e "create user test;\ncreate database ri_db;\ngrant all privileges on ri_db to test;\n" > create_user.sql
psql postgres< create_user.sql > /dev/null 2>&1

EOF
