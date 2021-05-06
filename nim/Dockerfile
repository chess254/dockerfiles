FROM codesignal/ubuntu-base:v9.2.0

# Install Nim
RUN curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y

# Set path to Nim compiler
ENV PATH /root/.nimble/bin:$PATH
