FROM codesignal/java:v9.0.0

ENV GROOVY_VERSION 3.0.7

# Upload build.gradle script
COPY build.gradle /usr/share/java/build.gradle

# The command below downloads the dependencies and stores them in the machine memory.
# It should NOT be removed because it will be used to run Groovy code in the coderunner.
RUN cd /usr/share/java \
    && gradle build --build-cache