FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         ca-certificates \
         curl \
    && rm -rf /var/lib/apt/lists/*

RUN set -ex \
    && curl -L -o azcopy.tar.gz https://aka.ms/downloadazcopy-v10-linux \
    && tar -xzf azcopy.tar.gz && rm -f azcopy.tar.gz \
    && cp ./azcopy_linux_amd64_10.1.2/azcopy /usr/local/bin/. \
    && chmod +x /usr/local/bin/azcopy \
    && rm -rf azcopy_linux_amd64_10.1.2

ENTRYPOINT ["azcopy"]
CMD ["--version"]
