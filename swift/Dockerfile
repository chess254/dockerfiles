FROM codesignal/ubuntu-base:v1.1

ENV SWIFT_BRANCH=swift-3.1.1-release \
    SWIFT_VERSION=swift-3.1.1-RELEASE \
    SWIFT_PLATFORM=ubuntu16.04 \
    SWIFT_PLATFORM_FOLDER=ubuntu1604

#Install Objective-C
ADD InstallObjectiveC.sh /root/InstallObjectiveC.sh

# Install dependencies
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        binutils \
        libedit2 \
        libxml2 \
        curl \
        gnupg \
        cmake \
        git \
# Download GPG keys, signature and Swift package, then unpack and cleanup
    && GNUPGHOME="$(mktemp -d)" \
    && SWIFT_ARCHIVE="${SWIFT_VERSION}-${SWIFT_PLATFORM}.tar.gz" \
    && SWIFT_ARCHIVE_SIGNATURE="${SWIFT_ARCHIVE}.sig" \
    && curl -fSsL "https://swift.org/keys/all-keys.asc" | gpg --import - \
    && curl -fSL# "https://swift.org/builds/${SWIFT_BRANCH}/${SWIFT_PLATFORM_FOLDER}/${SWIFT_VERSION}/${SWIFT_ARCHIVE}" -o "${SWIFT_ARCHIVE}" \
    && curl -fSsL "https://swift.org/builds/${SWIFT_BRANCH}/${SWIFT_PLATFORM_FOLDER}/${SWIFT_VERSION}/${SWIFT_ARCHIVE_SIGNATURE}" -o "${SWIFT_ARCHIVE_SIGNATURE}" \
    && gpg --verify "${SWIFT_ARCHIVE_SIGNATURE}" \
    && tar -zxvf "${SWIFT_ARCHIVE}" --directory / --strip-components=1 \
# Install Objective C
    && chmod 777 /root/InstallObjectiveC.sh \
    && /bin/bash -c "/root/InstallObjectiveC.sh" \
# Cleanup
    && rm -r "${GNUPGHOME}" "${SWIFT_ARCHIVE}" "${SWIFT_ARCHIVE_SIGNATURE}" \
    && apt-get -qq -y remove curl cmake git \
    && apt-get -qq -y autoremove \
    && rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH="/root/GNUstep/Library/Libraries:/usr/GNUstep/Local/Library/Libraries:/usr/GNUstep/System/Library/Libraries:${LD_LIBRARY_PATH}"
