FROM codesignal/java:v1.1

ENV GROOVY_VERSION 2.4.15

RUN apt-get update \
  && apt-get install -y --no-install-recommends wget unzip \
  && cd /tmp \
  && wget http://dl.bintray.com/groovy/maven/apache-groovy-binary-${GROOVY_VERSION}.zip \
  && unzip apache-groovy-binary-${GROOVY_VERSION}.zip \
  && mv groovy-${GROOVY_VERSION} /opt/groovy \
  && rm apache-groovy-binary-${GROOVY_VERSION}.zip \
# Cleanup, having some issues with held packages so calling autoremove and autoclean to resolve them
  && apt-get autoclean \
  && apt-get autoremove \
  && apt-get remove -qq -y wget unzip \
  && rm -rf /var/lib/apt/lists/*

ENV GROOVY_HOME=/opt/groovy \
    PATH=$GROOVY_HOME/bin/:$PATH