FROM codesignal/ubuntu-base:v9.2.0

RUN apt-get update \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -y --no-install-recommends golang-go \
    && rm -rf /var/lib/apt/lists/*

# installing modules in the pre-module mode, with "src" directory
ENV GO111MODULE=off

# installing go-junit-report for parsing test outputs,
# and other packages used in various tasks
RUN go get \
    github.com/jstemmer/go-junit-report \
    github.com/go-sql-driver/mysql

ENV PATH /root/go/bin:$PATH
