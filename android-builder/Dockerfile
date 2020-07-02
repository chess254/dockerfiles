FROM codesignal/ubuntu-base:v6.0

# Install some dependencies
RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y expect wget unzip \
    libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1

# Install java 8, unfortunately we can't use newer java versions (https://developer.android.com/studio/write/java8-support)
RUN apt-get install -y openjdk-8-jdk-headless

# Install Android SDK
RUN cd /opt \
    && wget --output-document=android-sdk.zip --quiet \
    https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
    && unzip android-sdk.zip -d /opt/android-sdk \
    && rm -f android-sdk.zip

# # Setup environment
ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

# Install the platform tools and the SDK tools
RUN echo yes | sdkmanager "platform-tools" \
    "platforms;android-30" \
    "platforms;android-29" \
    "platforms;android-28" \
    "platforms;android-27" \
    "platforms;android-26"

# Different versions of build tools
RUN echo yes | sdkmanager "platform-tools" \
        "build-tools;30.0.0" \
        "build-tools;29.0.3" "build-tools;29.0.2" \
        "build-tools;28.0.3" "build-tools;28.0.2" \
        "build-tools;27.0.3" "build-tools;27.0.2" "build-tools;27.0.1" \
        "build-tools;26.0.2" "build-tools;26.0.1" "build-tools;26.0.0" \
        "build-tools;25.0.3" "build-tools;25.0.2" \
        "build-tools;25.0.1" "build-tools;25.0.0" 

# COPY minimal-android-app /root/minimal-android-app

# RUN cd /root/minimal-android-app \
#     && ./gradlew assembleDebug
