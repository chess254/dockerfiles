FROM codesignal/java:v1.1


# RUN mkdir --parents /usr/src/app
# WORKDIR /usr/src/app
# ADD pom.xml /usr/src/app

# # Hopefully get downloads out of the way
# RUN mvn verify clean

# Cool alternative: use maven and dependency getting
# -Dartifact=groupId:artifactId:version[:packaging][:classifier]
RUN mvn dependency:get -Dartifact=junit:junit:4.12 \
    && mvn dependency:get -Dartifact=junit:junit:3.8.2 \
    && mvn dependency:get -Dartifact=org.junit.jupiter:junit-jupiter-engine:5.1.0 \
    && mvn dependency:get -Dartifact=org.hibernate:hibernate-agroal:5.3.7.FINAL \
    && mvn dependency:get -Dartifact=com.h2database:h2:1.4.197 \
    && mvn dependency:get -Dartifact=org.springframework.boot:spring-boot-starter-actuator:2.1.0.RELEASE \
    && mvn dependency:get -Dartifact=org.springframework.boot:spring-boot-starter-actuator:1.5.15.RELEASE \
    && mvn dependency:get -Dartifact=org.springframework.boot:spring-boot-starter-data-jpa:2.1.0.RELEASE \
    && mvn dependency:get -Dartifact=org.springframework.boot:spring-boot-starter-data-jpa:1.5.15.RELEASE \
    && mvn dependency:get -Dartifact=org.springframework.boot:spring-boot-starter-web:2.1.0.RELEASE \
    && mvn dependency:get -Dartifact=org.springframework.boot:spring-boot-starter-web:1.5.15.RELEASE \
    && mvn dependency:get -Dartifact=org.springframework.boot:spring-boot-starter-test:2.1.0.RELEASE \
    && mvn dependency:get -Dartifact=org.springframework.boot:spring-boot-starter-test:1.5.15.RELEASE
