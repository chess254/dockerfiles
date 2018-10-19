FROM codesignal/ubuntu-base:v1.1
 # npm install -g underscore request shelljs http sys jquery async connect validator ws co when forever debug \
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    # python-software-properties \
    curl \
    libcurl4-openssl-dev \
# Installing G++ 8.x version from the ppa
    g++-8 \
    gcc-8 \
# Install GNU Fortran 8
    gfortran-8 \
# Additional C++ dependencies
    libssl-dev \
    libjsoncpp-dev \
# Clean up
  && rm -rf /var/lib/apt/lists/*