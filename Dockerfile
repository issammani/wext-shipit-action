FROM node:current-alpine

RUN npm install @wext/shipit -g --unsafe-perm=true

ADD docker-entry.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
