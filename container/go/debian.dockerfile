ARG ARCH=amd64
# docker flavored arch name
ARG DOCKER_ARCH=amd64

# to make sure application is linked against glibc when cgo was used, only
# debian based builder is valid here
FROM arhatdev/builder-go:debian as builder
FROM ${DOCKER_ARCH}/debian:stable-slim

ONBUILD ARG TARGET
ONBUILD ARG APP=${TARGET}
ONBUILD COPY --from=builder /app/build/${TARGET} /${APP}
