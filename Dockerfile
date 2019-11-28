FROM golang:1.13 AS builder

ARG VERSION
ARG GIT_COMMIT

ENV GO111MODULE="on"
ENV VERSION="${VERSION}"
ENV GIT_COMMIT="${GIT_COMMIT}"

WORKDIR /go/src/github.com/4ops/bitcoind-exporter

COPY . .

RUN make build-alpine

# --- Runtime container

FROM scratch

LABEL maintainer="Anton Kulikov <anton.kulikov@protonmail.com>"

COPY --from=builder /go/src/github.com/4ops/bitcoind-exporter/bin/bitcoind-exporter /bitcoind-exporter

USER 65534
EXPOSE 9242
ENTRYPOINT ["/bitcoind-exporter"]
