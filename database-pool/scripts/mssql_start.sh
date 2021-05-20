#!/usr/bin/env sh

MSSQL_PID=${MSSQL_PID:-Developer}
MSSQL_SA_PASSWORD=${MSSQL_SA_PASSWORD:-StrongPass1}
MSSQL_COLUMN_SEPARATOR=${MSSQL_COLUMN_SEPARATOR:-" "}

mssql_ready() {
  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$MSSQL_SA_PASSWORD" -l1 -Q "SELECT @@VERSION" > /dev/null 2>&1
}

SQLSERVR_STARTED=0
if !(mssql_ready); then
  ACCEPT_EULA=Y MSSQL_PID="$MSSQL_PID" MSSQL_SA_PASSWORD="$MSSQL_SA_PASSWORD" nohup /opt/mssql/bin/sqlservr > /dev/null 2>&1 &
  SQLSERVR_STARTED=1
fi

while !(mssql_ready)
do
  sleep .5
  echo "Waiting for sqlservr..."
done

if [ $SQLSERVR_STARTED -eq 1 ]; then
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "$MSSQL_SA_PASSWORD" <<END >/dev/null
CREATE DATABASE test;
GO
USE test;

CREATE LOGIN test WITH PASSWORD = 'test', CHECK_POLICY = OFF;
CREATE USER test FOR LOGIN test;
GRANT CONTROL ON DATABASE::test TO test;
-- sysadmin role is required for raiserror with log command
-- which we use in the template to terminate the execution
exec sp_addsrvrolemember 'test', 'sysadmin';
GO
END
fi