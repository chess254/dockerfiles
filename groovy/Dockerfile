FROM codesignal/java:v9.2.1

ENV GROOVY_VERSION 3.0.7

RUN apt-get update \
  && apt-get install -y --no-install-recommends unzip \
  && cd /tmp \
  && wget https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-${GROOVY_VERSION}.zip \
  && unzip apache-groovy-binary-${GROOVY_VERSION}.zip \
  && mv groovy-${GROOVY_VERSION} /opt/groovy \
  && rm apache-groovy-binary-${GROOVY_VERSION}.zip \
  && rm -rf /var/lib/apt/lists/*

ENV GROOVY_HOME=/opt/groovy
ENV PATH=$GROOVY_HOME/bin/:$PATH
