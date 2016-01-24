FROM node:5.5.0
MAINTAINER cjnygard@gmail.com

RUN npm install gitbook-cli -g
RUN gitbook init

ENV DOCROOT /usr/src/app

WORKDIR $DOCROOT
VOLUME ["$DOCROOT"]

EXPOSE 4000

ENTRYPOINT ["gitbook"]
CMD ["build"]
