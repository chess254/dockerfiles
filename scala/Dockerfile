FROM codesignal/java:v1.1

ENV SCALA_VERSION=2.12.7 \
    SBT_VERSION=1.2.6

# Scala Expects this file to exist
# touch /usr/lib/jvm/java-11-openjdk-amd64/release
RUN  \
    apt-get update \
    && apt-get install -y --no-install-recommends wget curl \
# Install Scala, pipe curl into tar.
    && curl -fsL https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ \
    && echo >> /root/.bashrc  \
    && echo "export PATH=~/scala-$SCALA_VERSION/bin:$PATH" >> /root/.bashrc \
# Install SBT
    && curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb  \
    && dpkg -i sbt-$SBT_VERSION.deb  \
    && rm sbt-$SBT_VERSION.deb  \
    && apt-get update \
    && apt-get install sbt  \
    && sbt sbtVersion \
# Clean up
    && apt-get remove -qq -y wget curl \
    && rm -rf /var/lib/apt/lists/*