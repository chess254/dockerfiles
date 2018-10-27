FROM codesignal/ubuntu-base:v1.1

RUN apt-get update \
  && add-apt-repository -y ppa:jonathonf/lisp \
  && apt-get update \
  && apt-get install -y --no-install-recommends clojure \
  && rm -rf /var/lib/apt/lists/*