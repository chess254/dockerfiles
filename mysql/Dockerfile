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

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8' DEBIAN_FRONTEND='noninteractive'

#Install Node.js
RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

#Installing MySQL
RUN echo "mysql-apt-config	mysql-apt-config/select-server select mysql-8.0" | debconf-set-selections \
    && echo "mysql-apt-config	mysql-apt-config/select-product select OK" | debconf-set-selections \
    && echo "mysql-community-server mysql-community-server/root-pass password root" | debconf-set-selections \
    && echo "mysql-community-server mysql-community-server/re-root-pass password root" | debconf-set-selections \
    && wget https://dev.mysql.com/get/mysql-apt-config_0.8.13-1_all.deb -P /tmp/ \
    && dpkg -i /tmp/mysql-apt-config_0.8.13-1_all.deb \
    && rm -rf /tmp/* \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       debconf-utils \
       libmysqlclient-dev  \
       libpq-dev \
       libpq5 \
       libssl-dev \
       mysql-server \
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
# Clean up
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
