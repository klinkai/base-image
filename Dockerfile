FROM alpine:3.10
MAINTAINER brunosilvafranca
USER root

# Installing openjdk8
RUN apk update
RUN apk fetch openjdk8
RUN apk add openjdk8

# Declaring maven variables
ENV MAVEN_VERSION 3.6.0
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH

# Installing maven
RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

# Installing nodejs
RUN apk add --update nodejs nodejs-npm

# Installing yarn
RUN npm install --global yarn

# Testing installations
RUN java -version
RUN mvn --version
RUN node --version
RUN npm --version
RUN yarn --version
