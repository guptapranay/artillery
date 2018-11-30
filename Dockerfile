FROM node:8-alpine

RUN apk update \
    && apk add lighttpd bash \
    && rm -rf /var/cache/apk/*

RUN echo "dir-listing.activate = \"enable\"" >> /etc/lighttpd/lighttpd.conf

RUN npm install -g artillery@1.6.0-2

ADD run_artillery.sh /bin/

ENTRYPOINT ["/bin/run_artillery.sh"]
