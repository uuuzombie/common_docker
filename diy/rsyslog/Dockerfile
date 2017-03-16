FROM diy/debian:7.10
MAINTAINER grong@skygurad.com

# apt
RUN apt-get update && apt-get install -y  \
    rsyslog

# set timezone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Set the locale
#RUN locale-gen en_US.UTF-8

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"\nLANGUAGE="en_US.en"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY rsyslog.conf /etc


EXPOSE 514/tcp 514/udp
CMD ["rsyslogd", "-n"]