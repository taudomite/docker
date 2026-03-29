FROM alpine:3.14
WORKDIR /app

RUN apk update
RUN apk add --no-cache cmake build-base git && \
    git clone https://github.com/taudomite/lookbusy.git && \
    cd lookbusy && chmod +x ./configure && ./configure && make && \
    apk del build-base git cmake
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["sh", "/app/start.sh"]
