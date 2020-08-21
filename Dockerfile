FROM rocker/r-ver:4.0.0

WORKDIR fibonacci

RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "renv::init()"

COPY . .
RUN Rscript -e "renv::restore()"

COPY . .
RUN Rscript -e "install.packages('.', repos = NULL, type = 'source')"

RUN chmod +x R/cli.R

EXPOSE 8000
CMD Rscript -e "run_plumber(port = 8000, bind = 0.0.0.0)"

ENTRYPOINT ["R/cli.R","-v", "-p", "8000", "-b", "0.0.0.0" ]
