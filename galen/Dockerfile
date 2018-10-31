FROM codesignal/java:v1.1

# Add the two scripts
ADD xvfb_init /etc/init.d/xvfb
ADD xvfb-daemon-run /usr/bin/xvfb-daemon-run

# Install xvfb
RUN apt-get update \
    && apt-get install -y --no-install-recommends xvfb \
# Let added scripts be executable
    && chmod a+x /etc/init.d/xvfb \
    && chmod a+x /usr/bin/xvfb-daemon-run \
# Install Xvfb init script
    && update-rc.d xvfb defaults \
# Xvfb stuff should be set up.
#Installing Galen framework and related stuff
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    jq \
    dbus-x11 \
    unzip \
    wget \
    curl \
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