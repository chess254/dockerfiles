#!/usr/bin/env sh

mysql_ready() {
  mysqladmin ping --user=root --password=root > /dev/null 2>&1
}

if !(mysql_ready);
then
  /usr/sbin/mysqld --user=root &
fi

while !(mysql_ready)
do
  sleep .5
  echo "Waiting for mysqld..."
done

mysql -u'root' -p'root' << EOF
create user 'test' IDENTIFIED BY '';
create database ri_db;
grant all privileges on ri_db.* to 'test';
grant all privileges on sys.* to 'test';

EOF
