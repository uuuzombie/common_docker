FROM diy/debian:7.10
MAINTAINER grong@sky.com

# apt
RUN apt-get update && apt-get install -y  \
    rsyslog


COPY rsyslog.conf /etc

EXPOSE 514/tcp 514/udp
CMD ["rsyslogd", "-n"]