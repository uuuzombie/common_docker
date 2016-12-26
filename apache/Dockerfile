FROM daocloud.io/library/apache2:latest
MAINTAINER grong@skygurad.com

# apt
COPY sources.list /etc/apt
RUN apt-get update && apt-get install -y sudo procps net-tools less vim \
    curl locales


# set timezone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8



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