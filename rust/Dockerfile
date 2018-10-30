FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget file \
    && mkdir -p /opt/rust \
    && wget https://static.rust-lang.org/rustup.sh \
    && /bin/bash ./rustup.sh --disable-sudo \
# Cleanup
    && apt-get remove -qq -y wget file \
    && rm -rf /var/lib/apt/lists/* rustup.sh