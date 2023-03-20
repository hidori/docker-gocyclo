FROM golang:alpine

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates

ENV CGO_ENABLED=0

RUN go install github.com/fzipp/gocyclo/cmd/gocyclo@latest

ENTRYPOINT [ "gocyclo" ]
