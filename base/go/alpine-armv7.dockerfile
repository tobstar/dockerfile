# use native build to make sure qemu executable
FROM alpine:latest as downloader

COPY scripts/download.sh /download
RUN set -ex; /download qemu armv7

FROM arm32v7/golang:alpine

# add qemu for cross build
COPY --from=downloader /qemu* /usr/bin/

# install dependencies
RUN apk --no-cache add \
      ca-certificates wget build-base curl git make upx ;
