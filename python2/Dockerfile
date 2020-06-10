FROM codesignal/ubuntu-base:v6.0

ENV PYTHON_VERSION 2.7.18

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    tk-dev \ 
    tcl-dev \
    libsqlite3-dev \
    libbz2-dev \
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
  && /opt/python/${PYTHON_VERSION}/bin/python get-pip.py \
  && cd .. \
  && rm -rf temp

ENV PATH /opt/python/${PYTHON_VERSION}/bin:$PATH

RUN python -m pip install \
  pathlib \
  numpy \
  scipy \
  pandas \
  scikit-learn \
  keras \
  nltk==3.4.5 \
  requests \
  configparser \
  mysql-connector-python \
  MySql-Python \
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
  pandas-profiling==1.4.1 \
  plotly \
  tweepy \
  eli5 \
  pdpbox \
  shap==0.27 \
  xgboost \
  basilica \
  gensim \
  tensorflow \
  && python -m spacy download en_core_web_sm
