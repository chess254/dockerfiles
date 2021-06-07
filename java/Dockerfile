FROM codesignal/ubuntu-base:new

# Java
ENV ORACLE_LICENSE_VERSION=v1-2
ENV JAVA_VERSION=16
# Java Env
ENV GRADLE_VERSION=7.0
ENV MAVEN_VERSION=3.8.1
# Deps
ENV OPENJFX_VERSION=11.0.2
ENV JACKSON_VERSION=2.12.1
ENV MYSQL_CONNECTOR_VERSION=8.0.22

RUN add-apt-repository -y ppa:linuxuprising/java \
    && apt-get update \
    && echo oracle-java${JAVA_VERSION}-installer shared/accepted-oracle-license-${ORACLE_LICENSE_VERSION} select true | /usr/bin/debconf-set-selections \
    && apt-get install -y --no-install-recommends \
        oracle-java${JAVA_VERSION}-installer \
        oracle-java${JAVA_VERSION}-set-default \
        libmysql-java \
        maven \
    && rm -rf /var/lib/apt/lists/*

# install gradle
RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /opt/ \
    && unzip /opt/gradle-${GRADLE_VERSION}-bin.zip -d /opt/gradle \
    && apt-get remove -qq -y unzip \
    && apt-get autoremove -qq -y \
    && apt-get autoclean \
    && rm /opt/gradle-${GRADLE_VERSION}-bin.zip \
    && rm -rf /var/lib/apt/lists/*

# install maven
RUN wget https://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -P /opt/ \
    && mkdir /opt/maven \
    && tar -xzf /opt/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt/maven --strip-components 1 \
    && apt-get autoremove -qq -y \
    && apt-get autoclean \
    && rm /opt/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && rm -rf /var/lib/apt/lists/*

#install javafx
RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && wget https://download2.gluonhq.com/openjfx/${OPENJFX_VERSION}/openjfx-${OPENJFX_VERSION}_linux-x64_bin-sdk.zip -P /opt/ \
    && unzip /opt/openjfx-${OPENJFX_VERSION}_linux-x64_bin-sdk.zip -d /opt/javafx \
    && apt-get remove -qq -y unzip \
    && apt-get autoremove -qq -y \
    && apt-get autoclean \
    && rm /opt/openjfx-${OPENJFX_VERSION}_linux-x64_bin-sdk.zip \
    && rm -rf /var/lib/apt/lists/*

ENV CLASSPATH=/usr/share/java/*:$CLASSPATH \
    M2_HOME=/opt/maven \
    MAVEN_HOME=/opt/maven \
    PATH_TO_FX=/opt/javafx/javafx-sdk-${OPENJFX_VERSION}/lib \
    JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-oracle \
    PATH=/opt/maven/bin:/opt/gradle/gradle-${GRADLE_VERSION}/bin:$PATH

# download dependencies from maven repository with build.gradle script
COPY build.gradle /usr/share/java/build.gradle
RUN cd /usr/share/java \
    && gradle download \
    && rm build.gradle
