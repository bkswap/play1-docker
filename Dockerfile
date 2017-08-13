FROM openjdk:8
MAINTAINER sasaki_y

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y git python ant
WORKDIR /opt
RUN git clone https://github.com/playframework/play1.git
WORKDIR /opt/play1/framework
RUN ant jar

ENV PATH $PATH:/opt/play1
EXPOSE 9000

VOLUME /app
WORKDIR /
CMD ["play", "run", "app"]
