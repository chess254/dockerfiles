FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && curl https://sh.rustup.rs -sSf | sh \
# Cleanup
    && apt-get remove -qq -y curl \
    && rm -rf /var/lib/apt/lists/*