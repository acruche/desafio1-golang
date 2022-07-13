FROM golang:1.17-alpine AS builder

WORKDIR /usr/local/go/src/app
COPY app.go .
RUN go build

FROM scratch
COPY --from=builder /usr/local/go/src/app /
ENTRYPOINT [ "./app" ]