FROM codesignal/java:v8.0.2

RUN apt-get update \
    && wget https://www.scala-lang.org/files/archive/scala-2.12.10.deb \
    && dpkg -i scala-2.12.10.deb \
    && apt-get update \
    && apt-get install -y scala \
    && rm -rf scala-2.12.5.deb  /var/lib/apt/lists/*
