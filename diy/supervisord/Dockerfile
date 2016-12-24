FROM debian:7.10
MAINTAINER grong@skygurad.com

# apt
COPY sources.list /etc/apt
RUN apt-get update && apt-get install -y sudo procps net-tools less vim \
    curl locales supervisor openssh-server


# set timezone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 22 25
CMD ["/usr/bin/supervisord"]