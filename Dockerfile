FROM alpine

ARG VERSION
ARG TARGETARCH

WORKDIR /app

RUN apk add --no-cache wget curl jq && \
    if [ -z "$VERSION" ]; then \
        VERSION=$(curl -s https://api.github.com/repos/vnt-dev/vnts/releases/latest | jq -r .tag_name); \
    fi && \
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
    wget "https://github.com/vnt-dev/vnts/releases/download/${VERSION}/${FILE_NAME}" -O /app/vnts && \
    chmod +x /app/vnts

ENV PATH="/app:${PATH}"

ENTRYPOINT ["/app/vnts"]
