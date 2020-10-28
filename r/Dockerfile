FROM codesignal/ubuntu-base:v8.0

RUN add-apt-repository -y ppa:marutter/rrutter \
  && add-apt-repository -y ppa:marutter/c2d4u \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    r-base \
    r-base-dev \
  && apt-get install -y --no-install-recommends \
    r-cran-stringr \
    r-cran-jsonlite \
    r-cran-httr \
    r-cran-dplyr \
    r-cran-magrittr \
    r-cran-data.table \
    r-cran-futile.logger \
    r-cran-rmysql \
    r-cran-rpostgres \
    r-cran-matrixstats \
  && rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages('tryCatchLog')"

RUN Rscript -e "install.packages('GMCM')"
