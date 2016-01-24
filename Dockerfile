FROM node:5.5.0
MAINTAINER cjnygard@gmail.com


RUN apt-get update \
	&& apt-get install -y \
		wget \
		python \
		xdg-utils \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget --no-check-certificate -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | \
	python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"

RUN npm install gitbook-cli -g
RUN gitbook init

ENV DOCROOT /usr/src/app

WORKDIR $DOCROOT
VOLUME ["$DOCROOT"]

EXPOSE 4000

ENTRYPOINT ["gitbook"]
CMD ["build"]
