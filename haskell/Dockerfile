FROM codesignal/ubuntu-base:v5.0

# install GHC and Cabal
RUN add-apt-repository -y ppa:hvr/ghc \
  && apt-get update \
  && apt-get install -y --no-install-recommends ghc-8.8.1 cabal-install-3.0 libtinfo-dev \
  && rm -rf /var/lib/apt/lists/*

ENV PATH /root/.cabal/bin:/root/.local/bin:/opt/cabal/3.0/bin:/opt/ghc/8.8.1/bin:$PATH

# install aeson lib to print JSON
RUN cabal update \
  && cabal install aeson --global --lib
