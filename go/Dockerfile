FROM codesignal/ubuntu-base:v8.0.1

RUN add-apt-repository -y ppa:longsleep/golang-backports \
    && apt-get update \
    && apt-get install -y --no-install-recommends golang-go \
    && rm -rf /var/lib/apt/lists/*

# installing go-junit-report for parsing test outputs
RUN go get github.com/jstemmer/go-junit-report

ENV PATH $(go env GOPATH)/bin:$PATH
