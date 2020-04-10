###
# A base Docker Container, build on ubuntu and includes node.js, mysql, mongodb, and git.
###
FROM ubuntu:16.04

# Set proper locale
RUN apt-get clean \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
      bc \
      locales \
      software-properties-common \
      build-essential \
      curl \
      wget \
  && rm -rf /var/lib/apt/lists/* \
  && locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

#Install Node.js
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

#Installing mysql server
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

#Install mongodb server
RUN apt-get update \
    && apt-get install -y mongodb-server --no-install-recommends \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list \
    && apt-get update \
    && apt-get install -y mongodb-org=4.0.5 mongodb-org-server=4.0.5 mongodb-org-shell=4.0.5 mongodb-org-mongos=4.0.5 mongodb-org-tools=4.0.5 \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mongodb
# Setup mongodb server
RUN mkdir -p /data/mongodb /data/configdb \
    && chown -R mongodb:mongodb /data/mongodb /data/configdb

ADD mongod.conf /etc/mongod.conf
ADD mongodb.conf /etc/mongodb.conf

# Install git
RUN add-apt-repository ppa:git-core/ppa -y \
    && apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

# Installing PostgreSQL with extensions
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" >> /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-12 \
       postgresql-client-12 \
       postgresql-contrib-12 \
       postgis \
       postgresql-12-postgis-2.5 \
    && rm -rf /var/lib/apt/lists/*