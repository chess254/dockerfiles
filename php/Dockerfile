FROM codesignal/ubuntu-base:v3.0

RUN add-apt-repository ppa:ondrej/php \
  && apt-get -qq -y update \
  && apt-get install -y --no-install-recommends php7.2 \
  && apt-get install -y --no-install-recommends \
    php-curl \
    php-mysql \
  && rm -rf /var/lib/apt/lists/*
