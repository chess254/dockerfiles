###
# A base Docker Container, build on ubuntu and includes node.js, mysql, mongodb, and git.
###
FROM ubuntu:20.04

# Making tzdata installation noninteractive
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true
RUN echo 'tzdata tzdata/Areas select Etc' | debconf-set-selections \
    echo 'tzdata tzdata/Zones/Etc select UTC' | debconf-set-selections

# Set proper locale
RUN apt-get clean \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        bc \
        locales \
        build-essential \
        curl \
        wget \
        apt-transport-https \
        apt-utils \
        xz-utils \
        gnupg \
        ca-certificates \
        python-dev \
        lsb-release \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
ENV NVM_DIR /root/.nvm

# Install Node with nvm
ENV NODE_VERSION 14.16.1
RUN . $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
ENV NODE_PATH=$NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules

# Install vim
RUN apt-get update \
    && apt-get install -y --no-install-recommends vim \
    && rm -rf /var/lib/apt/lists/*

# Install gdb
RUN apt-get update \
    && apt-get install -y --no-install-recommends gdb \
    && rm -rf /var/lib/apt/lists/*

# Install git
RUN apt-get update \
    && apt-get install -y --no-install-recommends software-properties-common \
    && add-apt-repository ppa:git-core/ppa -y \
    && apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

# Installing PowerShell
RUN wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y powershell --no-install-recommends \
    && rm packages-microsoft-prod.deb \
    && rm -rf /var/lib/apt/lists/*

# Installing database CLI tools
RUN echo "deb http://cn.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse" >> /etc/apt/sources.list \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && wget -qO- https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2019.list)" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        mysql-client-5.7 \
        libmysqlclient-dev \
        libpq-dev \
        libpq5 \
        libssl-dev \
        postgresql-client-13 \
    && ACCEPT_EULA=Y apt-get install -y mssql-tools \
    && rm -rf /var/lib/apt/lists/*

# Copying database run scripts
RUN mkdir -p /etc/database-pool
COPY scripts/mongo_start.sh /etc/database-pool/mongo_start.sh
COPY scripts/mssql_start.sh /etc/database-pool/mssql_start.sh
COPY scripts/mysql_start.sh /etc/database-pool/mysql_start.sh
COPY scripts/postgresql_start.sh /etc/database-pool/postgresql_start.sh
RUN chmod +x /etc/database-pool/mongo_start.sh \
    && chmod +x /etc/database-pool/mssql_start.sh \
    && chmod +x /etc/database-pool/mysql_start.sh \
    && chmod +x /etc/database-pool/postgresql_start.sh
