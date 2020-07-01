FROM alpine

MAINTAINER Graham <graham@cubeops.net>

VOLUME /backup
VOLUME /data

RUN touch /key && touch /rsnapshot.cfg

RUN apk add --update rsnapshot tzdata

ADD entry.sh /entry.sh

CMD ["/bin/sh", "/entry.sh"]
