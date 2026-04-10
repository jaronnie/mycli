FROM alpine:latest

ENV CGO_ENABLED=0

LABEL \
    org.opencontainers.image.title="mycli" \
    org.opencontainers.image.description="My CLI tool" \
    org.opencontainers.image.url="https://github.com/jaronnie/mycli" \
    org.opencontainers.image.documentation="https://github.com/jaronnie/mycli#readme" \
    org.opencontainers.image.source="https://github.com/jaronnie/mycli" \
    org.opencontainers.image.licenses="MIT" \
    maintainer="jaronnie <jaron@jaronnie.com>"

WORKDIR /app

COPY dist/mycli_linux_amd64_v1/mycli /dist/mycli_linux_amd64/mycli
COPY dist/mycli_linux_arm64_v8.0/mycli /dist/mycli_linux_arm64/mycli

RUN if [ $(go env GOARCH) = "amd64" ]; then \
      cp /dist/mycli_linux_amd64/mycli /usr/local/bin/mycli; \
    elif [ $(go env GOARCH) = "arm64" ]; then \
      cp /dist/mycli_linux_arm64/mycli /usr/local/bin/mycli; \
    fi

RUN apk update --no-cache \
    && apk add --no-cache tzdata ca-certificates \
    && rm -rf /dist

ENTRYPOINT ["mycli"]
