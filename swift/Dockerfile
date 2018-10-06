FROM ubuntu:16.04

RUN apt-get update && apt-get install sudo
RUN apt-get install -y npm
RUN apt-get install -y nodejs
RUN npm install -g underscore request shelljs http sys jquery async connect validator  ws co when forever  debug && export NODE_PATH=/usr/local/lib/node_modules/

RUN apt-get install -y python-software-properties
RUN apt-get install -y software-properties-common

ENV SWIFT_BRANCH swift-3.1.1-release
ENV SWIFT_VERSION swift-3.1.1-RELEASE
ENV SWIFT_PLATFORM ubuntu16.04
ENV SWIFT_PLATFORM_FOLDER ubuntu1604

# Install dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
        binutils \
        clang \
        libcurl4-openssl-dev \
        libedit2 \
        libicu-dev \
        make \

        libpython2.7 \
        libxml2 \

        ca-certificates \
        curl \
        git \
        gnupg \
        rsync \
    && rm -rf /var/lib/apt/lists/*

# Download GPG keys, signature and Swift package, then unpack and cleanup
RUN GNUPGHOME="$(mktemp -d)" \
    && SWIFT_ARCHIVE="${SWIFT_VERSION}-${SWIFT_PLATFORM}.tar.gz" \
    && SWIFT_ARCHIVE_SIGNATURE="${SWIFT_ARCHIVE}.sig" \

    && curl -fSsL "https://swift.org/keys/all-keys.asc" | gpg --import - \
    && curl -fSL# "https://swift.org/builds/${SWIFT_BRANCH}/${SWIFT_PLATFORM_FOLDER}/${SWIFT_VERSION}/${SWIFT_ARCHIVE}" -o "${SWIFT_ARCHIVE}" \
    && curl -fSsL "https://swift.org/builds/${SWIFT_BRANCH}/${SWIFT_PLATFORM_FOLDER}/${SWIFT_VERSION}/${SWIFT_ARCHIVE_SIGNATURE}" -o "${SWIFT_ARCHIVE_SIGNATURE}" \
    && gpg --verify "${SWIFT_ARCHIVE_SIGNATURE}" \
    && tar -zxvf "${SWIFT_ARCHIVE}" --directory / --strip-components=1 \

    && rm -r "${GNUPGHOME}" "${SWIFT_ARCHIVE}" "${SWIFT_ARCHIVE_SIGNATURE}"

#Install Objective-C
ADD InstallObjectiveC.sh /root/InstallObjectiveC.sh
RUN chmod 777 /root/InstallObjectiveC.sh
RUN /bin/bash -c "/root/InstallObjectiveC.sh"
ENV LD_LIBRARY_PATH="/root/GNUstep/Library/Libraries:/usr/GNUstep/Local/Library/Libraries:/usr/GNUstep/System/Library/Libraries:${LD_LIBRARY_PATH}"
