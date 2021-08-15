FROM openjdk:11

ENV KAFKA_VERSION=2.8.0

COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /opt/kafka

RUN curl -sSL https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_2.13-${KAFKA_VERSION}.tgz | \
      tar -xzv --strip=1 --exclude bin/windows* && \
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["./bin/kafka-server-start.sh", "./conf/server.properties"]
