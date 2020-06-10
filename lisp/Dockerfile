FROM codesignal/ubuntu-base:v6.0

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  libsigsegv2 \
  libffcall1 \
  libreadline5 \
  && wget http://archive.debian.org/debian/pool/main/c/clisp/clisp_2.49-8.1_amd64.deb \
  && dpkg -i clisp_2.49-8.1_amd64.deb \
  && wget https://beta.quicklisp.org/quicklisp.lisp -P /tmp \
  && echo "(quicklisp-quickstart:install)\n(ql:add-to-init-file)\n" >> /tmp/quicklisp.lisp \
  && printf '\n' | clisp /tmp/quicklisp.lisp \
  && rm clisp_2.49-8.1_amd64.deb \
  && rm -rf /var/lib/apt/lists/*
