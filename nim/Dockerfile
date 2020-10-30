FROM codesignal/ubuntu-base:v8.0.1

RUN apt-get update \
    && add-apt-repository -y ppa:jonathonf/nimlang \
    && apt-get update \
    && apt-get install -y --no-install-recommends nim \
    && rm -rf /var/lib/apt/lists/*
