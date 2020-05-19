FROM codesignal/ubuntu-base:v5.6

RUN apt-get -qq update \
    && apt-get -qq -y install bzip2 --no-install-recommends \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3.8.2 \
    && conda update conda \
    && apt-get -qq -y remove bzip2 \
    && apt-get -qq -y autoremove \
    && apt-get autoclean \ 
    && apt-get -qq -y install python-pip python-setuptools --no-install-recommends \
    && python2 -m pip install -U pip \
    && rm -rf /var/lib/apt/lists/*

ENV PATH /opt/conda/bin:$PATH
RUN conda create -n py2 -c conda-forge -y python=2.7.18 \
       numpy \
       scipy \
       pandas \
       scikit-learn \
       keras \
       nltk \
       requests \
       configparser \
       mysql-connector-python \
       MySql-Python \
       SQLAlchemy \
       Psycopg2 \
       toolz \
       appdirs \
       attrs \
       click \
       toml \
       spacy \
       gensim \
       matplotlib \
       seaborn \
       pytest \
       pymongo \
       flask \
       flask-sqlalchemy \
       flask-migrate \
       requests \
       ipywidgets \
       pandas-profiling \
       plotly \
       tweepy \
       category_encoders \
       eli5 \
       pdpbox \
       shap \
       xgboost \
       spacy-model-en_core_web_md \
       tensorflow=2.1 \
    && conda create -n py3 -c conda-forge -y python=3 \
       numpy \
       scipy \
       pandas \
       scikit-learn \
       keras \
       nltk \
       requests \
       mysql-connector-python \
       PyMySQL \
       SQLAlchemy \
       Psycopg2 \
       toolz \
       appdirs \
       attrs \
       click \
       toml \
       spacy \
       gensim \
       matplotlib \
       seaborn \
       pytest \
       pymongo \
       flask \
       flask-sqlalchemy \
       flask-migrate \
       requests \
       ipywidgets \
       pandas-profiling \
       plotly \
       tweepy \
       category_encoders \
       eli5 \
       pdpbox \
       shap \
       xgboost \
      spacy-model-en_core_web_md \
      tensorflow=2.1

RUN python2 -m pip install basilica && python -m pip install basilica

RUN ["/bin/bash", "-c", "source activate py3 && python -m nltk.downloader popular \
      && rm -rf /var/lib/apt/lists/* /var/log/dpkg.log \
      && conda clean --all --yes"]
