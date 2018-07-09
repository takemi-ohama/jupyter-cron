From hammer/jupyter

MAINTAINER "takemi.ohama" <takemi.ohama@gmail.com>

USER root

RUN apt-get update && apt-get install -yq --no-install-recommends \
    busybox-static
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
ENV TZ=Asia/Tokyo

CMD ["busybox", "crond", "-f", "-L", "/dev/stderr"]

RUN mkdir -p /var/spool/cron/crontabs/ && \
    echo "*/3 * * * * /home/jovyan/work/user_cluster/batch.sh >> /dev/stdout " > /var/spool/cron/crontabs/root
