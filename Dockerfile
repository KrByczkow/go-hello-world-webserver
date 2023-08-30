## Use a container for "HelloWorld-Webserver" with Image "golang"
FROM golang:latest AS PROC

ARG GOROOT="/usr/local/go"
ARG GOPATH=""

RUN git clone https://github.com/KrByczkow/go-hello-world-webserver -b devel /app

RUN mkdir -p /app/out
WORKDIR /app

RUN go build -o out/hw-webserver HelloWorldWeb


## Launches ubuntu
FROM ubuntu:latest

COPY --from=PROC /app/out/hw-webserver /usr/local/bin/hw-webserver

EXPOSE 8080
CMD hw-webserver
