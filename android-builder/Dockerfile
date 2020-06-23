FROM codesignal/ubuntu-base:v6.0

RUN apt-get update

# Install some dependencies
RUN dpkg --add-architecture i386 && apt-get update \
    && apt-get install -y expect wget unzip \
    libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1

# Install java
RUN apt-get install -y openjdk-8-jdk-headless

# Install the Android SDK
RUN cd /opt && wget --output-document=android-sdk.zip --quiet \
    https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip \
    && unzip android-sdk.zip -d /opt/android-sdk && rm -f android-sdk.zip

# Setup environment
ENV ANDROID_HOME /opt/android-sdk
ENV PATH ${PATH}:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

# Install the platform tools and the SDK tools
RUN echo yes | sdkmanager "platform-tools" "platforms;android-28"

# Install gradle
RUN apt-get update
RUN apt-get install -y --no-install-recommends unzip
RUN wget https://services.gradle.org/distributions/gradle-5.6.4-all.zip -P /root/
RUN mkdir -p /root/.gradle/wrapper/dists
RUN unzip /root/gradle-5.6.4-all.zip -d /root/.gradle/wrapper/dists/gradle-5.6.4-all
#RUN mv /root/.gradle/wrapper/dists/gradle-5.6.4 /root/.gradle/wrapper/dists/gradle-5.6.4-all
RUN apt-get remove -qq -y unzip
RUN apt-get autoremove -qq -y
RUN apt-get autoclean
RUN rm /root/gradle-5.6.4-all.zip
RUN rm -rf /var/lib/apt/lists/*

ENV GRADLE_USER_HOME=/root/.gradle

#COPY minimal-android-app /root/minimal-android-app
#
#RUN cd /root/minimal-android-app \
#    && ./gradlew assembleDebug

# Go to workspace
#RUN mkdir -p /opt/workspace
#WORKDIR /opt/workspace