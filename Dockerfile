FROM alpine:3.10
MAINTAINER brunosilvafranca
USER root

# Installing ca certificates and openssl
 RUN   apk update \                                                                                                                                                                                                                        
  &&   apk add ca-certificates wget \                                                                                                                                                                                                      
  &&   update-ca-certificates \
  &&   apk add openssl

# Installing wget
RUN apk add --no-cache wget

#Installing curl
RUN apk --no-cache add curl

# Installing openjdk8
RUN apk update \
  &&   apk fetch openjdk8 \
  &&   apk add openjdk8

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
