FROM ubuntu:16.04

# Set proper locale
RUN apt-get clean \
  && apt-get update \
  && apt-get install -y \
      bc \
      locales \
      python-software-properties \
      software-properties-common \
      build-essential \
  && rm -rf /var/lib/apt/lists/* \
  && locale-gen en_US.UTF-8

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

#Install Node.js and sudo
RUN apt-get update \
    && apt-get install -f -y curl sudo \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && apt-get -qq -y remove curl \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/*

#grab oracle java (auto accept licence)
RUN add-apt-repository -y ppa:linuxuprising/java \
    && apt-get update \
    && echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true | /usr/bin/debconf-set-selections \
    && apt-get install -y  \
        oracle-java11-installer \
        oracle-java11-set-default \
        libjackson2-core-java \
        libjackson2-databind-java \
        libmysql-java \
        maven \
    && rm -rf /var/lib/apt/lists/*

ENV CLASSPATH=/usr/share/java/*:$CLASSPATH

# Add the two scripts
ADD xvfb_init /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run

# Install xvfb
RUN apt-get update \
    && apt-get -f install \
    && apt-get install -y xvfb \
# Let added scripts be executable
    && chmod a+x /etc/init.d/xvfb \
    && update-rc.d xvfb defaults \
    && chmod a+x /usr/bin/xvfb-daemon-run \
# Done with Xvfb set up.
#Installing Galen framework and related dependencies
    && apt-get update \
    && apt-get install -y \
    jq \
    dbus-x11 \
    unzip \
    wget \
    curl \
    libgtk-3-dev \
    libasound2 \
    libasound2-dev \
    && wget https://codefightsuserpics.s3.amazonaws.com/galen-ide.zip -P /tmp/ \
    && unzip /tmp/galen-ide.zip -d /tmp \
    && cd /tmp/galen-ide \
# The setup script uses sudo, let's remove it.
    && . /tmp/galen-ide/assembleAndInstall.sh \
#Install Firefox 46 version. This exact version is needed for galen-ide
    && cd /usr/local \
    && wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/46.0.1/linux-x86_64/en-US/firefox-46.0.1.tar.bz2 \
    && tar xvjf firefox-46.0.1.tar.bz2 \
    && ln -s /usr/local/firefox/firefox /usr/bin/firefox \
# Cleanup
    && apt-get remove -qq curl wget unzip \
    && rm firefox-46.0.1.tar.bz2 \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY :99