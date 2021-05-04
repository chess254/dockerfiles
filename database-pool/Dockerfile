FROM codesignal/ubuntu-base:dev

# Install mysql server
RUN echo "deb http://cn.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/lowercase-table-names select Enabled" | debconf-set-selections \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libmysqlclient-dev  \
        libpq-dev \
        libpq5 \
        libssl-dev \
        mysql-server-5.7 \
    && mkdir -p /var/lib/mysql \
    && mkdir -p /var/run/mysqld \
    && mkdir -p /var/log/mysql \
    && chown -R mysql:mysql /var/lib/mysql \
    && chown -R mysql:mysql /var/run/mysqld \
    && chown -R mysql:mysql /var/log/mysql\
    # UTF-8 and bind-address
    && sed -i -e "$ a [client]\n\n[mysql]\n\n[mysqld]"  /etc/mysql/my.cnf \
    && sed -i -e "s/\(\[client\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf \
    && sed -i -e "s/\(\[mysql\]\)/\1\ndefault-character-set = utf8/g" /etc/mysql/my.cnf \
    && sed -i -e "s/\(\[mysqld\]\)/\1\ninit_connect='SET NAMES utf8'\ncharacter-set-server = utf8\ncollation-server=utf8_unicode_ci\nbind-address = 0.0.0.0/g" /etc/mysql/my.cnf \
    && echo "mysql ALL = NOPASSWD: /usr/sbin/service mysql start" | cat >> /etc/sudoers \
    # Clean up
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# Install mongodb server
RUN curl -fsSL https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add - \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=4.4.3 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mongodb

# Copy conf and service file so that "service mongodb start" will work
COPY mongod.conf /etc/mongod.conf
COPY mongodb-service-init.sh /etc/init.d/mongodb

# Make sure the data directories exist and service file is executable
RUN mkdir -p /data/mongodb /data/configdb \
    && chown -R mongodb:mongodb /data/mongodb /data/configdb \
    && chmod +x /etc/init.d/mongodb

# Installing PostgreSQL with extensions
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        postgresql-13 \
        postgresql-client-13 \
        postgresql-contrib-13 \
        postgis \
        postgresql-13-postgis-2.5 \
    && rm -rf /var/lib/apt/lists/*

# Installing Microsoft SQL Server
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2019.list)" \
    && apt-get update \
    && ACCEPT_EULA=Y apt-get install -y mssql-server mssql-tools unixodbc-dev \
    && rm -rf /var/lib/apt/lists/*

# Installing database run scripts
RUN mkdir -p /etc/database-pool
COPY scripts/mongo_start.sh /etc/database-pool/mongo_start.sh
COPY scripts/mysql_start.sh /etc/database-pool/mysql_start.sh
COPY scripts/mssql_start.sh /etc/database-pool/mssql_start.sh
COPY scripts/postgresql_start.sh /etc/database-pool/postgresql_start.sh
COPY server/index.js /etc/database-pool/index.js

RUN npm install -g forever \
    && chmod +x /etc/database-pool/mongo_start.sh \
    && chmod +x /etc/database-pool/mysql_start.sh \
    && chmod +x /etc/database-pool/mssql_start.sh \
    && chmod +x /etc/database-pool/postgresql_start.sh

CMD ["forever", "/etc/database-pool/index.js"]
