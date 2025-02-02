FROM codesignal/ubuntu-base:v9.2.0

ENV PYTHON_VERSION 3.9.5

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    tk-dev \
    tcl-dev \
    libsqlite3-dev \
    python-distutils-extra \
    libffi-dev \
    libbz2-dev \
    liblzma-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir temp \
  && cd temp \
  && curl -O https://www.python.org/ftp/python/${PYTHON_VERSION}/Python-${PYTHON_VERSION}.tgz \
  && tar -xvzf Python-${PYTHON_VERSION}.tgz \
  && cd Python-${PYTHON_VERSION} \
  && ./configure \
    --prefix=/opt/python/${PYTHON_VERSION} \
    --enable-shared \
    --enable-ipv6 \
    --enable-unicode=ucs4 \
    LDFLAGS=-Wl,-rpath=/opt/python/${PYTHON_VERSION}/lib,--disable-new-dtags > /dev/null 2>&1 \
  && make > /dev/null 2>&1 \
  && make install > /dev/null 2>&1 \
  && cd .. \
  && curl -O https://bootstrap.pypa.io/get-pip.py \
  && /opt/python/${PYTHON_VERSION}/bin/python3 get-pip.py \
  && cd .. \
  && rm -rf temp

ENV PATH /opt/python/${PYTHON_VERSION}/bin:$PATH


RUN python3 -m pip install \
  # Pin numpy to match tensorflow's dependency.
  # Must be installed first to fix potential conflict with shap numpy version:
  # https://github.com/slundberg/shap/pull/1802#issuecomment-846299228
  numpy==1.19.5 \
  # Install keras first to avoid dependency conflict with eli5.
  keras

RUN python3 -m pip install \
  pathlib \
  scipy \
  pandas \
  scikit-learn \
  nltk \
  requests \
  configparser \
  mysql-connector-python \
  PyMySQL \
  SQLAlchemy \
  psycopg2 \
  toolz \
  appdirs \
  attrs \
  click \
  toml \
  spacy \
  matplotlib \
  seaborn \
  pytest \
  pymongo \
  flask \
  flask-sqlalchemy \
  flask-migrate \
  ipywidgets \
  pandas-profiling \
  plotly \
  tweepy \
  eli5 \
  pdpbox \
  shap \
  xgboost \
  basilica \
  tensorflow \
  # Installed as an optional peer dependency of gensim
  python-Levenshtein \
  gensim \
  category_encoders \
  timeout_decorator \
  Django \
  sortedcontainers \
  && python3 -m spacy download en_core_web_sm

# Removing python symlink for python2 and adding for python3 
RUN rm /usr/bin/python \
  && ln -s /opt/python/${PYTHON_VERSION}/bin/python3 /usr/bin/python
