FROM codesignal/java:v5.0

RUN CLOJURE_VERSION=1.10.1.469 ;\
  apt-get update \
  && apt-get -y install rlwrap --no-install-recommends \
  && curl -sSL "https://download.clojure.org/install/linux-install-${CLOJURE_VERSION}.sh" -o /tmp/clojure-install.sh \
  && chmod +x /tmp/clojure-install.sh \
  && bash /tmp/clojure-install.sh \
  && rm -rf /tmp/clojure-install.sh \
  # run clojure to download dependencies
  && clj -e "(clojure-version)" \
  && rm -rf /var/lib/apt/lists/*
