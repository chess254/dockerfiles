FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
  && apt-get install -y --no-install-recommends wget \
  && wget http://downloads.dlang.org/releases/2.x/2.079.1/dmd_2.079.1-0_amd64.deb \
  && dpkg -i dmd_2.079.1-0_amd64.deb \
  && apt-get remove -qq -y wget \
  && rm -rf /var/lib/apt/lists/*