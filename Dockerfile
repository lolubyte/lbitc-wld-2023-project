# this same shows how we can extend/change an existing official image from Docker Hub
FROM ubuntu:rolling

# Basic Meta data about the Image maintainers
LABEL maintainer="Daniel Aboyewa"
LABEL version="0.1"
LABEL description="This is a custom Docker Image for lbitc Winter Devops Class"
LABEL Email="lolubyte.it@gmail.com"

#prevent dpkg error
ENV TERM=xterm-256color

#Set  mirrors to the closet  mirror to me
#RUN sed –i "s/http:\/\/archive./http:\/\/nz.archive./g"  /etc/apt/sources.list

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Install Python runtime
RUN  apt-get install –y  \
           -o APT::Install-Recommended=false –o APT::Install-Suggests=false \
python3 python3-pip

RUN pip3 install virtualenv
		
# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]