From hammer/jupyter

MAINTAINER "takemi.ohama" <takemi.ohama@gmail.com>

USER root

RUN apt-get update && apt-get install -yq --no-install-recommends \
    cron 
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo '*/3 * * * *  jovyan cd /home/jovyan/work/user_cluster && ./batch.sh' > /etc/crontab

ENTRYPOINT ["cron","-f"]
