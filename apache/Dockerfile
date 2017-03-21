FROM daocloud.io/library/apache2:latest
MAINTAINER grong@sky.com

# apt
COPY sources.list /etc/apt
RUN apt-get update && apt-get install -y \
    procps net-tools netcat telnet lsof \
    less vim curl wget locales perl

# set timezone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"\nLANGUAGE="en_US.en"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"


#ServerName
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf


# Configure Apache2
ENV APACHE_RUN_USER     www-data
ENV APACHE_RUN_GROUP    www-data
ENV APACHE_LOG_DIR      /var/log/apache2
ENV APACHE_PID_FILE     /var/run/apache2.pid
ENV APACHE_RUN_DIR      /var/run/apache2
ENV APACHE_LOCK_DIR     /var/lock/apache2
ENV APACHE_LOG_DIR      /var/log/apache2


# Expose ourselves
EXPOSE 8443 8447

# Run!
ENTRYPOINT [ "/usr/sbin/apache2", "-D", "FOREGROUND" ]
#ENTRYPOINT [ "exec", "apache2", "-D", "FOREGROUND" ]