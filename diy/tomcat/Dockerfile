FROM diy/debian:7.10
MAINTAINER grong@sky.com

# apt
RUN apt-get update && apt-get install -y \
    ttf-mscorefonts-installer libxtst-dev libxrender-dev \
    libonig2 libpcre3 libqdbm14 libxml2 mime-support libmagic1 libedit2


# install jdk & tomcat

RUN mkdir -p /opt/sps
COPY deb_files/ /opt/sps
RUN dpkg -i /opt/sps/java_1.8.0_45.deb && \
    dpkg -i /opt/sps/tomcat_8.0.24.deb && \
	rm -rf /skyguard-jre && \
	rm -rf /skyguard-tomcat && \
	rm -rf /opt/sps


# environment
ENV JAVA_HOME /usr/skyguardtools/java
ENV JRE_HOME /usr/skyguardtools/java/jre
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$PATH

ENV CATALINA_HOME /opt/skyguard/tomcat
ENV CATALINA_BASE /opt/skyguard/tomcat
ENV CLASSPATH /usr/skyguardtools/java/lib:/usr/skyguardtools/java/jre/lib
#RUN /bin/bash -c "source /etc/profile"

# copy resources
COPY conf/ /opt/skyguard/tomcat/conf/

RUN mkdir -p /usr/share/fonts/myfonts
COPY conf/simsun.ttc /usr/share/fonts/myfonts
WORKDIR /usr/share/fonts/myfonts
RUN mkfontscale && mkfontdir

RUN mkdir -p /opt/skyguard/sps/setup
COPY skyguardsetup.exe /opt/skyguard/sps/setup
COPY conf/ssl /opt/skyguard/sps/ssl

RUN chown -R tomcat:tomcat /opt/skyguard/tomcat && \
    chown -R tomcat:tomcat /opt/skyguard/sps


# not work
# use docker run -it --add-host sky.com:172.21.23.140
#RUN echo "172.21.23.140    sky.com" >> /etc/hosts

WORKDIR /opt/skyguard/tomcat

#
VOLUME /opt/skyguard/tomcat/webapps
