FROM codesignal/java:v1.1

RUN mkdir --parents /usr/src/app
ADD pom.xml /usr/src/app

# Hopefully get downloads out of the way
RUN mvn verify clean --fail-never