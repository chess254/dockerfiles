FROM codesignal/java:v2.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget \
    && wget http://www.scala-lang.org/files/archive/scala-2.12.5.deb \
    && dpkg -i scala-2.12.5.deb \
    && apt-get update \
    && apt-get install -y scala \
    && rm -rf scala-2.12.5.deb  /var/lib/apt/lists/*
