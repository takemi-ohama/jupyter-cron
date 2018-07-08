From hammer/jupyter

MAINTAINER "takemi.ohama" <takemi.ohama@gmail.com>

USER root

RUN apt-get update && apt-get install -yq --no-install-recommends \
    busybox-static
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT busybox crond -l 2 -L /dev/stderr -f  

RUN mkdir -p /var/spool/cron/crontabs/ && \
    echo "01 * * * * /home/jovyan/work/user_cluster/batch.sh" > /var/spool/cron/crontabs/root
