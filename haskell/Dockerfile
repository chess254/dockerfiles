FROM codesignal/ubuntu-base:v1.0

RUN apt-get update \
	&& apt-get install -y --no-install-recommends haskell-platform \
	&& cabal update \
	&& cabal install JSON \
	&& rm -rf /var/lib/apt/lists/*
