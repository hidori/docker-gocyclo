FROM golang:1.22-alpine3.20

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates

ENV CGO_ENABLED=0

RUN go install github.com/fzipp/gocyclo/cmd/gocyclo@latest

ENTRYPOINT [ "gocyclo" ]
