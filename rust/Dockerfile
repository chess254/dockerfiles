FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl file \
    && mkdir -p /opt/rust \
    && curl -sf -L https://static.rust-lang.org/rustup.sh | sh \
# Cleanup
    && apt-get remove -qq -y curl file \
    && rm -rf /var/lib/apt/lists/*