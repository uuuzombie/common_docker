FROM diy/debian:7.10
MAINTAINER grong@skygurad.com

# apt
#RUN apt-get update && apt-get install -y


# install elasticsearch

RUN mkdir -p /opt/program
COPY deb_files/ /opt/program
RUN dpkg -i /opt/program/elasticsearch-5.0.0.deb && \
	rm -rf /opt/program


# config


# environment

# copy resources


# es-head
