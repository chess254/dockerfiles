FROM codesignal/ubuntu-base:v1.1

#Installing Galen framework and related stuff
RUN apt-get install -y jq dbus-x11 unzip
RUN wget https://codefightsuserpics.s3.amazonaws.com/galen-ide.zip -P /tmp/
RUN unzip /tmp/galen-ide.zip -d /tmp && cd /tmp/galen-ide && . /tmp/galen-ide/assembleAndInstall.sh
#Install Firefox 46 version. This exact version is needed for galen-ide
RUN cd /usr/local && wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/46.0.1/linux-x86_64/en-US/firefox-46.0.1.tar.bz2 && tar xvjf firefox-46.0.1.tar.bz2 && ln -s /usr/local/firefox/firefox /usr/bin/firefox
ENV DISPLAY :99