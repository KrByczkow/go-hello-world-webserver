## Use a container for "HelloWorld-Webserver" with Image "golang"
FROM golang:latest AS PROC

ARG GOROOT="/usr/local/go"
ARG GOPATH=""

RUN git clone https://github.com/KrByczkow/go-hello-world-webserver /app

RUN mkdir -p /app/bin

RUN go build -o out/hw-webserver HelloWorldWeb


## run alpine
FROM alpine:latest

COPY --from=PROC /app/out/hw-webserver /usr/local/bin/hw-webserver

EXPOSE 8080
RUN hw-webserver