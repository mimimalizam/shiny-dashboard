FROM rocker/rstudio
MAINTAINER milana.stojadinov@gmail.com

ADD config/rserver.conf etc/rstudio/rserver.conf

RUN R -e "install.packages('shinydashboard', repos = 'http://cran.r-project.org')"
