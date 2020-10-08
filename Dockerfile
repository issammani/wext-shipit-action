FROM node:current-alpine

RUN npm install --save @wext/shipit

ADD docker-entry.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
