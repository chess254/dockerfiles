FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    perl \
    libjson-perl \
    libdbi-perl \
    libdbd-mysql-perl \
    && rm -rf /var/lib/apt/lists/*
