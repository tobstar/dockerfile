# use native build to make sure qemu executable
FROM alpine:latest as downloader

COPY scripts/download.sh /download
RUN set -ex; /download qemu armv6

FROM arm32v6/python:3.8-alpine

# add qemu for cross build
COPY --from=downloader /qemu* /usr/bin/

# install build tools
RUN apk --no-cache add ca-certificates wget build-base curl ;\
    pip3 install pipenv ;
