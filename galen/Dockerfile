FROM codesignal/java:v1.1

# Add the two scripts
ADD xvfb_init /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run

# Install xvfb
RUN apt-get update \
    && apt-get -f install \
# <Begin> Lets just install a bunch of things to try and get Galen to work
   && apt-get install -y python-software-properties software-properties-common \
   && npm install -g sequelize underscore crypto-js lodash request shelljs http sys jquery async connect mysql mysql2 validator  ws co when forever  debug \
# <End>
    && apt-get install -y xvfb \
# Let added scripts be executable
    && chmod a+x /etc/init.d/xvfb \
    && update-rc.d xvfb defaults \
    && chmod a+x /usr/bin/xvfb-daemon-run \
# Xvfb stuff should be set up.
#Installing Galen framework and related stuff
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
    && cat /tmp/galen-ide/assembleAndInstall.sh | sed -e 's/sudo //g' > /tmp/galen-ide/assembleAndInstall.sh \
    && . /tmp/galen-ide/assembleAndInstall.sh \
#Install Firefox 46 version. This exact version is needed for galen-ide
    && cd /usr/local \
    && wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/46.0.1/linux-x86_64/en-US/firefox-46.0.1.tar.bz2 \
    && tar xvjf firefox-46.0.1.tar.bz2 \
    && ln -s /usr/local/firefox/firefox /usr/bin/firefox \
# Cleanup
    && rm firefox-46.0.1.tar.bz2 \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY :99