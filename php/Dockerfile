FROM codesignal/ubuntu-base:v8.0.1

# Install PHP & dependencies
RUN add-apt-repository ppa:ondrej/php \
  && apt-get -qq -y update \
  && apt-get install -y --no-install-recommends php8.0 \
  && apt-get install -y --no-install-recommends \
    php8.0-curl \
    php8.0-mysql \
    php8.0-xml \
    php8.0-mbstring \
  && rm -rf /var/lib/apt/lists/*

# Install composer 
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php --filename=composer \
  && php -r "unlink('composer-setup.php');"

# Install required packages
RUN ./composer global require phpunit/phpunit=9.3 \
  && ./composer global require symfony/process=3.3 \
  && ./composer global require guzzlehttp/guzzle=6.3 

# Expose phpunit to PATH and clean up. COMPOSER_HOME_PATH - is a directory, where composer installed the packages
# Adding symbolic link to run filesystem tests `phpunit tests --test-suffix=.php`
RUN COMPOSER_HOME_PATH=$(./composer global config bin-dir --absolute) \
  && ln -s ${COMPOSER_HOME_PATH}/phpunit phpunit \
  && ENV PATH ${COMPOSER_HOME_PATH}:$PATH \
  && rm -rf composer
