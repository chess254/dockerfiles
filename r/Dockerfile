FROM codesignal/ubuntu-base:v5.0

RUN add-apt-repository -y ppa:marutter/rrutter \
  && add-apt-repository -y ppa:marutter/c2d4u \
  && apt-get update \
  && apt-get install -y --no-install-recommends r-base \
  && apt-get install -y --no-install-recommends \
    r-cran-stringr \
    r-cran-jsonlite \
    r-cran-httr \
    r-cran-dplyr \
    r-cran-magrittr \
    r-cran-data.table \
  && rm -rf /var/lib/apt/lists/*

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'https://cloud.r-project.org/'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('tryCatchLog')"
