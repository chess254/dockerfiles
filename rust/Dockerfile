FROM codesignal/ubuntu-base:v4.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && mkdir -p /opt/rust \
    && curl https://sh.rustup.rs -sSf | HOME=/opt/rust sh -s -- --no-modify-path -y \
    && chmod -R 777 /opt/rust \
# Cleanup
    && rm -rf /var/lib/apt/lists/*

ENV PATH=/opt/rust/.cargo/bin:$PATH

# Install default Rust items.
RUN rustup default stable
