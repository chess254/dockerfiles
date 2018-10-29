FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget \
    && wget http://www.scala-lang.org/files/archive/scala-2.12.5.deb \
    && dpkg -i scala-2.12.5.deb \
    && apt-get update \
    && apt-get install -y --no-install-recommends scala \
# Remove deb file and clean up
    && apt-get remove -qq -y wget \
    && rm scala-2.15.5.deb \
    && rm -rf /var/lib/apt/lists/*