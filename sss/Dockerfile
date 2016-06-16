FROM java:8-jre

MAINTAINER Dieter Theiler "dtheiler@tugraz.at"

ADD https://github.com/learning-layers/SocialSemanticServer/releases/download/v12.1.1-alpha/sss.package.zip /
#COPY sss.package.zip /

RUN apt-get update
RUN apt-get install -y unzip mysql-client vim sed
RUN unzip sss.package.zip "sss.package/*"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
