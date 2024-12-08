# Use Alpine as the base image
FROM alpine

# Set the working directory
WORKDIR /app

# Install necessary dependencies
RUN apk add --no-cache wget jq

# Fetch the latest version number
RUN VERSION=$(curl -s https://api.github.com/repos/vnt-dev/vnts/releases/latest | jq -r .tag_name) && \
    wget "https://github.com/vnt-dev/vnts/releases/download/${VERSION}/vnts-x86_64-unknown-linux-musl-${VERSION}.tar.gz"

# Extract the file and place its contents directly in the /app directory
RUN tar -xzvf vnts-x86_64-unknown-linux-musl-${VERSION}.tar.gz -C /app && \
    rm vnts-x86_64-unknown-linux-musl-${VERSION}.tar.gz

# Add execution permissions to the vnts file
RUN chmod +x /app/vnts

# Set environment variable to include /app in the PATH
ENV PATH="/app:${PATH}"

# Set the default command, allowing argument passing
ENTRYPOINT ["/app/vnts"]

# The default command passed at runtime (can be overridden with -e or --args when running the container)
CMD ["--help"]
