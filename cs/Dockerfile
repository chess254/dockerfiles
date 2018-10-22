FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | tee /etc/apt/sources.list.d/mono-official.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       mono-mcs \
       mono-devel \
       mono-xsp4 \
       mono-xsp4-base \
       mono-complete \
       ca-certificates-mono \
       fsharp \
    && rm -rf /var/lib/apt/lists/*
#Additional libs for CS
RUN apt-get update \
    && apt-get install -y --no-install-recommends wget unzip \
    && wget https://dev.mysql.com/get/Downloads/Connector-Net/mysql-connector-net-8.0.11-noinstall.zip -P /tmp/ \
    && unzip /tmp/mysql-connector-net-8.0.11-noinstall.zip -d /tmp && cd /tmp/v4.5.2 && cp MySql.Data.dll /usr/lib/mono/ && cd /usr/lib/mono/ && gacutil -i MySql.Data.dll -package MySql.Data \
    && wget https://github.com/JamesNK/Newtonsoft.Json/releases/download/11.0.2/Json110r2.zip -P /tmp/ \
    && rm -rf /tmp/Newtonsoft && unzip /tmp/Json110r2.zip -d /tmp/Newtonsoft || : && cd /tmp/Newtonsoft/Bin/net45 && cp Newtonsoft.Json.dll /usr/lib/mono/ && cd /usr/lib/mono/ && gacutil -i Newtonsoft.Json.dll -package Newtonsoft.Json \
    && apt-get -qq -y remove wget unzip \
    && rm -rf /var/lib/apt/lists/*