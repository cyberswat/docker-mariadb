FROM cyberswat/docker-ubuntu

MAINTAINER Kevin Bridges <kevin@cyberswat.com>

## Add additional repositories.
#
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
#
## mariadb 0xcbcb082a1bb943db
RUN echo "deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu precise main" >> /etc/apt/sources.list
#
## Receive relevant keys.
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0xcbcb082a1bb943db

#
RUN  export DEBIAN_FRONTEND=noninteractive
ENV  DEBIAN_FRONTEND noninteractive
RUN apt-get update
#
## Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
#
## python-software-properties is necessary for mariadb.
#RUN apt-get install -y pwgen inotify-tools python-software-properties mariadb-server

RUN apt-get install -y mariadb-server
## Help mysql understand the filesystem
RUN cat /proc/mounts > /etc/mtab

#ADD my.cnf /etc/mysql/my.cnf

WORKDIR /etc/mysql
EXPOSE 3306

#ENTRYPOINT ["/usr/bin/mysqld_safe"]
