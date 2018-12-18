FROM codesignal/ubuntu-base:v2.0

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

# install gradle
RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && wget https://services.gradle.org/distributions/gradle-4.10.2-bin.zip -P /opt/ \
    && unzip /opt/gradle-4.10.2-bin.zip -d /opt/gradle \
    && apt-get remove -qq -y unzip \
    && apt-get autoremove -qq -y \
    && apt-get autoclean \
    && rm /opt/gradle-4.10.2-bin.zip \
    && rm -rf /var/lib/apt/lists/*

ENV CLASSPATH=/usr/share/java/*:$CLASSPATH \
    PATH=/opt/gradle/gradle-4.10.2/bin:$PATH
