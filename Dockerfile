FROM golang:1.13 as builder
ENV CGO_ENABLED=0
WORKDIR /app
COPY . /app/
RUN go build -o go-app

FROM scratch
ENTRYPOINT ["/go-app"]
COPY --from=builder /app/go-app /