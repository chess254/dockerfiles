FROM codesignal/ubuntu-base:v6.0

# Install some dependencies
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y expect wget unzip \
    libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1

# Install java
RUN apt-get install -y openjdk-8-jdk-headless

# Install Android SDK
RUN cd /opt \
    && wget --output-document=android-sdk.zip --quiet \
    https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
    && unzip android-sdk.zip -d /opt/android-sdk \
    && rm -f android-sdk.zip

# Setup environment
ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

# Install the platform tools and the SDK tools
RUN echo yes | sdkmanager "platform-tools" \
    "platforms;android-30" \
    "platforms;android-29" \
    "platforms;android-28" \
    "platforms;android-27" \
    "platforms;android-26" \
    "platforms;android-25"

COPY minimal-android-app /root/minimal-android-app

RUN cd /root/minimal-android-app \
    && ./gradlew assembleDebug
