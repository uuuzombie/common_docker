FROM daocloud.io/library/tomcat:latest
MAINTAINER grong@sky.com

# apt
COPY sources.list /etc/apt
RUN apt-get update && apt-get install -y \
    procps net-tools netcat telnet lsof \
    less vim curl wget locales perl \
    ttf-mscorefonts-installer libxtst-dev libxrender-dev  ucf \
    libonig2 libpcre3 libqdbm14 libxml2 mime-support libmagic1 libedit2 

# set timezone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"\nLANGUAGE="en_US.en"'>/etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"


# install jdk & tomcat
RUN mkdir -p /opt/sps
COPY deb_files/ /opt/sps
RUN dpkg -i /opt/sps/java_1.8.0_45.deb && dpkg -i /opt/sps/tomcat_8.0.24.deb && \
    dpkg -i /opt/sps/php5-common_5.6.23-1~dotdeb+7.1_amd64.deb && \
    dpkg -i /opt/sps/php5-cli_5.6.23-1~dotdeb+7.1_amd64.deb && \
	rm -rf /sky-jre && rm -rf /sky-tomcat && rm -rf /opt/sps

# environment
ENV JAVA_HOME /usr/skytools/java
ENV JRE_HOME /usr/skytools/java/jre
ENV PATH $JAVA_HOME/bin:$JRE_HOME/bin:$PATH

ENV CATALINA_HOME /opt/sky/tomcat
ENV CATALINA_BASE /opt/sky/tomcat
ENV CLASSPATH /usr/skytools/java/lib:/usr/skytools/java/jre/lib

# copy resources
COPY conf/ /opt/sky/tomcat/conf/

RUN mkdir -p /usr/share/fonts/myfonts
COPY conf/simsun.ttc /usr/share/fonts/myfonts
WORKDIR /usr/share/fonts/myfonts
RUN mkfontscale && mkfontdir

# copy packdsa
RUN mkdir -p /opt/sky/sps/dsa
COPY ./packdsa/* /opt/sky/sps/dsa/
RUN chmod +x -R /opt/sky/sps/dsa

# copy packusa
RUN mkdir -p /opt/sky/sps/directory
COPY ./packusa/* /opt/sky/sps/directory/
RUN chmod +x -R /opt/sky/sps/directory

RUN mkdir -p /opt/sky/sps && chown -R tomcat:tomcat /opt/sky/tomcat && \
                                  chown -R tomcat:tomcat /opt/sky/sps && \
                                  chown -R tomcat:tomcat /opt/sky/sps/dsa && \
                                  chown -R tomcat:tomcat /opt/sky/sps/directory

WORKDIR /opt/sky/tomcat
VOLUME /opt/sky/tomcat/webapps



# copy webapp
COPY webManager.war /opt/sky/tomcat/webapps
COPY build.txt /opt/sky/sps

# change own
RUN chown -R tomcat:tomcat /opt/sky/tomcat
RUN chown -R tomcat:tomcat /opt/sky/sps

RUN mkdir -p /tmp/tomcat7-tomcat-tmp
RUN chown -R tomcat:tomcat /tmp/tomcat7-tomcat-tmp

EXPOSE 8009

USER tomcat

CMD ["-Dnop","-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager","-Djava.awt.headless=true -Xmx1024m -Xms1024m",\
    "-XX:+UseConcMarkSweepGC","-Dbuild.compiler=javac","-Djava.endorsed.dirs=/opt/sky/tomcat/endorsed","-classpath", \
    "/opt/sky/tomcat/bin/bootstrap.jar:/opt/sky/tomcat/bin/tomcat-juli.jar","-Dcatalina.base=/opt/sky/tomcat" ,\
    "-Dcatalina.base=/opt/sky/tomcat","-Dcatalina.home=/opt/sky/tomcat","-Djava.io.tmpdir=/tmp/tomcat7-tomcat-tmp", \
    "org.apache.catalina.startup.Bootstrap","start"]

ENTRYPOINT ["/usr/skytools/java/jre/bin/java"]

