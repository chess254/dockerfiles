FROM codesignal/java:v9.0.0

ENV SCALA_VERSION='2.13.5'

# Upload build.gradle script
COPY build.gradle /usr/share/java/build.gradle

# The command below downloads the dependencies and stores them in the machine memory.
# It should NOT be removed because it will be used to run scala code in the coderunner.
RUN cd /usr/share/java \
    && gradle build --build-cache