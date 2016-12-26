FROM debian:7.10
MAINTAINER grong@skygurad.com

# apt
COPY sources.list /etc/apt
RUN apt-get update && apt-get install -y sudo procps net-tools less vim curl locales  \
    perl postfix

# set timezone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Set the locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8


EXPOSE 25
CMD ["/bin/sh", "-c", "service postfix start; umask 0 && truncate -s0 /var/log/mail.log; tail -n0 -F /var/log/mail.log"]

#ADD run.sh /run.sh
#RUN chmod 755 /run.sh
#CMD ["/run.sh"]