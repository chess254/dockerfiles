#!/usr/bin/env sh

MSSQL_PID=${MSSQL_PID:-Developer}
MSSQL_SA_PASSWORD=${MSSQL_SA_PASSWORD:-StrongPass1}
MSSQL_COLUMN_SEPARATOR=${MSSQL_COLUMN_SEPARATOR:-" "}

mssql_ready() {
  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$MSSQL_SA_PASSWORD" -l1 -Q "SELECT @@VERSION" > /dev/null 2>&1
}

ACCEPT_EULA=Y MSSQL_PID="$MSSQL_PID" MSSQL_SA_PASSWORD="$MSSQL_SA_PASSWORD" nohup /opt/mssql/bin/sqlservr > /dev/null 2>&1 &

while !(mssql_ready)
do
  sleep .5
  echo "Waiting for sqlservr..."
done
