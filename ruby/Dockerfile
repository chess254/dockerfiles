FROM codesignal/ubuntu-base:v5.6

# Install required dependencies for Ruby and ruby-build
# https://github.com/rbenv/ruby-build/wiki#ubuntudebianmint
RUN apt-get -qq update \
    && apt-get install --no-install-recommends -y \
        autoconf \
        bison \
        build-essential \
        libssl-dev \
        libyaml-dev \
        libreadline6-dev \
        zlib1g-dev \
        libncurses5-dev \
        libffi-dev \
        libgdbm3 \
        libgdbm-dev \
        libdb-dev \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install ruby-build and build Ruby
RUN git clone https://github.com/rbenv/ruby-build.git \
    && PREFIX=/usr/local ./ruby-build/install.sh \
    && ruby-build 2.7.1 /usr/local/ruby-2.7.1

# Update path to include Ruby
ENV PATH=/usr/local/ruby-2.7.1/bin:$PATH

# Install dependencies
RUN gem install rspec pg mysql2 activemodel activerecord activesupport json faker pry

# Verify the installation
RUN ruby --version
