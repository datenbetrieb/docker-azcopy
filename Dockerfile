FROM debian:bookworm-slim

# curl -v https://aka.ms/downloadazcopy-v10-linux
ENV RELEASE_STAMP=20240326
ENV RELEASE_VERSION=10.24.0

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         ca-certificates \
         curl \
    && rm -rf /var/lib/apt/lists/*

RUN set -ex \
    && curl -L -o azcopy.tar.gz https://azcopyvnext.azureedge.net/releases/release-${RELEASE_VERSION}-${RELEASE_STAMP}/azcopy_linux_amd64_${RELEASE_VERSION}.tar.gz \
    && tar -xzf azcopy.tar.gz && rm -f azcopy.tar.gz \
    && cp ./azcopy_linux_amd64_*/azcopy /usr/local/bin/. \
    && chmod +x /usr/local/bin/azcopy \
    && rm -rf azcopy_linux_amd64_*

ENTRYPOINT ["azcopy"]
CMD ["--version"]
