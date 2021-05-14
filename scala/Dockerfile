FROM codesignal/java:v9.0.0

ENV SCALA_VERSION=2.12.10

RUN apt-get update \
    && wget https://www.scala-lang.org/files/archive/scala-${SCALA_VERSION}.deb \
    && dpkg -i scala-${SCALA_VERSION}.deb \
    && apt-get update \
    && apt-get install -y scala \
    && rm -rf scala-${SCALA_VERSION}.deb  /var/lib/apt/lists/*
