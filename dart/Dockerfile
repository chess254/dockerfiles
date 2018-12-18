FROM codesignal/ubuntu-base:v2.0

#Install Dart 1.24.2
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
# Enable HTTPS for apt.
    apt-transport-https \
    curl \
# Get the Google Linux package signing key.
    && curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
# Set up the location of the stable repository.
    && curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends dart=1.24.2-1 \
# Cleanup
    && apt-get remove -qq -y curl apt-transport-https \
    && rm -rf /var/lib/apt/lists/*



