FROM codesignal/ubuntu-base:v5.0

RUN apt-get update \
    && add-apt-repository -y ppa:jonathonf/nimlang \
    && apt-get update \
    && apt-get install -y --no-install-recommends nim \
    && rm -rf /var/lib/apt/lists/*
