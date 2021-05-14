FROM codesignal/ubuntu-base:v9.2.0

RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
# Installing G++ 11.x version from the ppa
    g++-11 \
    gcc-11 \
# Install GNU Fortran 11
    gfortran-11 \
# Additional C++ dependencies
    libssl-dev \
    libjsoncpp-dev \
    libboost-all-dev \
# Cpprestsdk
    libcpprest-dev \
# Required for Catch 2
    git \
    cmake \
# Install Catch 2
  && git clone https://github.com/catchorg/Catch2.git -b v2.13.6 \
  && cd Catch2 \
  && cmake -Bbuild -H. -DBUILD_TESTING=OFF \
  && cmake --build build/ --target install \
# Clean up
  && apt-get remove -y git cmake \
  && cd .. \
  && rm -rf Catch2/ \
  && rm -rf /var/lib/apt/lists/*

# Removing g++, gcc, gfortran symlink for default GCC and adding them for GCC-11
RUN rm -f /usr/bin/g++ \
    /usr/bin/gcc \
    /usr/bin/gfortran \
  && ln -s /usr/bin/g++-11 /usr/bin/g++ \
  && ln -s /usr/bin/gcc-11 /usr/bin/gcc \
  && ln -s /usr/bin/gfortran-11 /usr/bin/gfortran

# Creating object file for C++ unit tests
RUN mkdir -p /catch2-utils \
  && cd /catch2-utils \
  && echo "#define CATCH_CONFIG_MAIN" > testsRunner.cpp \
  && echo "#include <catch2/catch.hpp>" >> testsRunner.cpp \
  && g++ -std=c++20 -I/usr/local/include/catch2 testsRunner.cpp -c \
  && rm testsRunner.cpp \
  && g++ -std=c++20 testsRunner.o -o catch2Version
