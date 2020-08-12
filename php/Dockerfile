FROM codesignal/ubuntu-base:v7.1

# Install PHP & dependencies
RUN add-apt-repository ppa:ondrej/php \
  && apt-get -qq -y update \
  && apt-get install -y --no-install-recommends php7.4 \
  && apt-get install -y --no-install-recommends \
    php7.4-curl \
    php7.4-mysql \
    php7.4-xml \
  && rm -rf /var/lib/apt/lists/*

# Install PHPUnit
RUN wget -O phpunit https://phar.phpunit.de/phpunit-8.phar \
  && chmod +x phpunit \
  && mv phpunit /usr/local/bin/phpunit
