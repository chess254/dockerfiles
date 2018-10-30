FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && mkdir -p /opt/rust \
    && curl https://sh.rustup.rs -sSf | HOME=/opt/rust sh -s -- --disable-sudo --no-modify-path -y \
    && chmod -R 777 /opt/rust \
# Cleanup
    && apt-get remove -qq -y curl \
    && rm -rf /var/lib/apt/lists/*