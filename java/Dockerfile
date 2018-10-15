FROM codesignal/ubuntu-base:v1.1

RUN add-apt-repository -y ppa:linuxuprising/java \
	&& apt-get update \
	&& echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
	&& apt-get install -y --no-install-recommends \
 		oracle-java10-installer \
 		oracle-java10-set-default \
 		libjackson2-core-java \
 		libjackson2-databind-java \
 		libmysql-java \
 		maven \
 	&& rm -rf /var/lib/apt/lists/*
 
ENV CLASSPATH=/usr/share/java/*:$CLASSPATH
