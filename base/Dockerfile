###
# A base Docker Container, build on ubuntu and includes node.js and mysql.
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
  && rm -rf /var/lib/apt/lists/* \
  && locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

#Install Node.js
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && apt-get -qq -y remove curl \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

#Installing mysql server
RUN echo "deb http://cn.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "mysql-server mysql-server/root_password password root" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       libmysqlclient-dev  \
       libpq-dev \
       libpq5 \
       libssl-dev \
       mysql-server-5.7 \
       postgresql \
       postgresql-client \
       postgresql-contrib \
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

# Hack required for mysql to work with the "overlay2" filesystem, see link for more details:
#   https://serverfault.com/questions/870568/fatal-error-cant-open-and-lock-privilege-tables-table-storage-engine-for-use/872576#872576
RUN echo "chown -R mysql:mysql /var/lib/mysql /var/run/mysqld" >> ~/.bashrc
