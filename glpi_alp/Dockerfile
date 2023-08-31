FROM routerology/phpine:latest
MAINTAINER gri.daniel@gmail.com
LABEL my_name="daniel grigore"
LABEL my_youtube="https://www.youtube.com/@routerologyblog1111"

RUN apk update && \
	apk add \
	cronie \
	&& rm -rf /var/lib/apt/lists/*

ENV TZ="Europe/Bucharest"

RUN mkdir /home/apache

COPY ./wrapper_script.sh /root/wrapper_script.sh
COPY cron/php /etc/cron.d
COPY cron/glpi /home/apache/

RUN crontab -u apache /home/apache/glpi

ENTRYPOINT ["/bin/sh","/root/wrapper_script.sh"]
