FROM codesignal/java:v8.1.2

# Upload build.gradle script
COPY build.gradle /usr/share/java

# The command below downloads the dependencies and stores them in the machine memory.
# It should NOT be removed because it will be used to run kotlin code in the coderunner.
RUN cd /usr/share/java \
    && gradle build --build-cache
