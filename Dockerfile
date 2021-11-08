FROM node:17-alpine

LABEL maintainer="Imre Faragó <imi.farago@gmail.com>"

WORKDIR /app

RUN npm install -g laravel-echo-server

COPY laravel-echo-server.json /app

COPY docker-entrypoint.sh /app
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]

VOLUME /app

EXPOSE 6001

HEALTHCHECK --interval=1m --timeout=5s \
CMD curl --fail http://localhost:6001/heartbeat || exit 1

CMD ["start"]
