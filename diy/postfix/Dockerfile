FROM diy/debian:7.10
MAINTAINER grong@sky.com

# apt
RUN apt-get update && apt-get install -y \
    postfix


EXPOSE 25
CMD ["/bin/sh", "-c", "service postfix start; umask 0 && truncate -s0 /var/log/mail.log; tail -n0 -F /var/log/mail.log"]

#ADD run.sh /run.sh
#RUN chmod 755 /run.sh
#CMD ["/run.sh"]