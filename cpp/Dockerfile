FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y npm
RUN apt-get install -y nodejs
RUN npm install -g underscore request shelljs http sys jquery async connect validator  ws co when forever  debug && export NODE_PATH=/usr/local/lib/node_modules/

RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common

RUN apt-get install -y curl libcurl4-openssl-dev

#Installing G++ 8.x version
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test && apt-get update
RUN apt-get install -y g++-8
RUN apt-get install -y gcc-8

#Installing GNU Fortran 8
RUN apt-get install -y gfortran-8

#Installing additional libssl for C++
RUN apt-get install -y libssl-dev libjsoncpp-dev
