FROM diy/debian:7.10
MAINTAINER grong@skygurad.com

# apt
RUN apt-get update && apt-get install -y \
    supervisor openssh-server


RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


EXPOSE 22 25
CMD ["/usr/bin/supervisord"]