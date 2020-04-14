#!/usr/bin/env sh

cd /usercode/
service postgresql start > /dev/null 2>&1
echo "----BEGIN----"

su - postgres << EOF
echo -e "create user test;\ncreate database ri_db;\ngrant all privileges on ri_db to test;\n" > create_user.sql
psql postgres< create_user.sql > /dev/null 2>&1

psql -U postgres -q -A -F $'\t' --pset footer -d ri_db < $1

EOF

echo "----END----"
