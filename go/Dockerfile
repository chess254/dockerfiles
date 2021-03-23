FROM codesignal/ubuntu-base:v9.0.0

RUN apt-get update \
    && add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -y --no-install-recommends golang-go \
    && rm -rf /var/lib/apt/lists/*

# installing go-junit-report for parsing test outputs
RUN go get github.com/jstemmer/go-junit-report

ENV PATH /root/go/bin:$PATH
