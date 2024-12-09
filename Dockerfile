FROM golang:1.23-alpine3.20 AS builder

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates

ENV CGO_ENABLED=0

RUN go install github.com/fzipp/gocyclo/cmd/gocyclo@latest \
    && cp `which gocyclo` /gocyclo

FROM alpine:3.21 AS runner

COPY --from=builder /gocyclo /usr/local/bin

ENTRYPOINT [ "gocyclo" ]
