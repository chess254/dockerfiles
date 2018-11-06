FROM ubuntu:16.04

# Set proper locale
RUN apt-get clean \
    && apt-get update \
    && apt-get install -y locales \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'


#Installing Galen framework and related stuff
RUN apt-get update \
    && apt-get install -y unzip wget bzip2 \
    && wget https://codefightsuserpics.s3.amazonaws.com/galen-ide.zip -P /tmp/ \
    && unzip /tmp/galen-ide.zip -d /tmp \
#Install Firefox 46 version. This exact version is needed for galen-ide
    && cd /usr/local \
    && wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/46.0.1/linux-x86_64/en-US/firefox-46.0.1.tar.bz2 \
    && tar -xvjf firefox-46.0.1.tar.bz2 \
    && ln -s /usr/local/firefox/firefox /usr/bin/firefox \
# Cleanup
    && rm /tmp/galen-ide.zip /usr/local/firefox-46.0.1.tar.bz2 \
    && rm -rf /var/lib/apt/lists/*

# Installing xvfb and related stuff
# Install Xvfb init script
ADD xvfb_init /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run

RUN apt-get update \
    && apt-get -f install \
    && apt-get install -fy xvfb \
    && chmod a+x /etc/init.d/xvfb \
    && update-rc.d xvfb defaults \
    && chmod a+x /usr/bin/xvfb-daemon-run \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
    && apt-get install -y \
    bc \
    sudo \
    software-properties-common \
    curl \
    libcurl4-openssl-dev \
    clang \
    libsigsegv2 \
    libffcall1 \
    libreadline5 \
    make \
    libreadline-dev \
    libgtk-3-dev \
    libasound2 \
    libasound2-dev \
    jq \
    dbus-x11 \
#Install Node.js
    && curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - \
    && apt-get install -y nodejs maven \
    && rm -rf /var/lib/apt/lists/*

ENV NODE_PATH=/usr/lib/node_modules/

#grab oracle java (auto accept licence)
RUN add-apt-repository -y ppa:linuxuprising/java \
    && apt-get update \
    && echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections \
    && apt-get install -y --no-install-recommends \
        oracle-java11-installer \
        oracle-java11-set-default \
        libjackson2-core-java \
        libjackson2-databind-java \
        libmysql-java \
        maven \
    && rm -rf /var/lib/apt/lists/*

ENV CLASSPATH=/usr/share/java/*:$CLASSPATH

#Installing Galen framework and related stuff
RUN cd /tmp/galen-ide \
    && . /tmp/galen-ide/assembleAndInstall.sh


ENV DISPLAY :99
    