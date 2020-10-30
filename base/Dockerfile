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
      apt-transport-https \
      apt-utils \
      xz-utils \
      gnupg \
      python-dev \
  && rm -rf /var/lib/apt/lists/* \
  && locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
ENV NVM_DIR /root/.nvm

# Install Node with nvm
ENV NODE_VERSION 14.14.0
RUN . $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
ENV NODE_PATH=$NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules

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
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 20691EEC35216C63CAF66CE1656408E390CFB1F5 \
    && echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list \
    && apt-get update \
    # mongodb-org-server tries to call systemctl, which we don't have, so symlink it to just return "true"
    && ln -s /bin/true /usr/local/bin/systemctl \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mongodb-org=4.4.1 \
    && rm -f /usr/local/bin/systemctl \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mongodb

# Copy conf and service file so that "service mongodb start" will work
COPY mongod.conf /etc/mongod.conf
COPY mongodb-service-init.sh /etc/init.d/mongodb

# Make sure the data directories exist and service file is executable
RUN mkdir -p /data/mongodb /data/configdb \
    && chown -R mongodb:mongodb /data/mongodb /data/configdb \
    && chmod +x /etc/init.d/mongodb

# Install vim
RUN apt-get update \
    && apt-get install -y --no-install-recommends vim \
    && rm -rf /var/lib/apt/lists/*

# Install gdb
RUN apt-get update \
    && apt-get install -y --no-install-recommends gdb \
    && rm -rf /var/lib/apt/lists/*

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
       postgresql-13 \
       postgresql-client-13 \
       postgresql-contrib-13 \
       postgis \
       postgresql-13-postgis-2.5 \
    && rm -rf /var/lib/apt/lists/*

# Installing PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y powershell --no-install-recommends \
    && rm packages-microsoft-prod.deb \
    && rm -rf /var/lib/apt/lists/*
