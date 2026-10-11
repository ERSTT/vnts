FROM alpine

ARG TARGETARCH

WORKDIR /app

RUN apk add --no-cache wget curl jq && \
    VERSION=$(curl -s https://api.github.com/repos/vnt-dev/vnts/releases/latest | jq -r .tag_name) && \
    if [ "$TARGETARCH" = "amd64" ]; then \
        ARCH_STR="x86_64-unknown-linux-musl"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
        ARCH_STR="aarch64-unknown-linux-musl"; \
    elif [ "$TARGETARCH" = "arm" ]; then \
        ARCH_STR="arm-unknown-linux-musleabihf"; \
    else \
        echo "Unsupported architecture: $TARGETARCH" && exit 1; \
    fi && \
    FILE_NAME="vnts2-${ARCH_STR}-${VERSION}" && \
    wget "https://github.com/vnt-dev/vnts/releases/download/${VERSION}/${FILE_NAME}.tar.gz" && \
    tar -xzvf ${FILE_NAME}.tar.gz -C /app && \
    rm ${FILE_NAME}.tar.gz && \
    mv /app/vnts2-* /app/vnts || true && \
    chmod +x /app/vnts

ENV PATH="/app:${PATH}"

ENTRYPOINT ["/app/vnts"]

CMD ["--help"]
