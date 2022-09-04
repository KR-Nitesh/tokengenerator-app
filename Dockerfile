FROM ubuntu:20.04
ENV JAVA_HOME=/u03/middleware/jdk-11
ENV PATH=${PATH}:${JAVA_HOME}/bin

RUN mkdir -p /u03/middleware/
RUN mkdir -p /u03/applications/

WORKDIR /u03/middleware
ADD https://download.java.net/openjdk/jdk11/ri/openjdk-11+28_linux-x64_bin.tar.gz .

RUN tar -xzvf openjdk-11+28_linux-x64_bin.tar.gz
RUN rm openjdk-11+28_linux-x64_bin.tar.gz

WORKDIR /u03/applications/

COPY target/tokengenerator-1.0.jar .
CMD java -cp /u03/applications/tokengenerator-1.0.jar com.tg.service.TokenGeneratorService
