#FROM golang:1.12 AS build
#
#COPY ./src /go/src/app
#
#WORKDIR /go/src/app
#
#RUN go get -d
#
#RUN go build -o main.go
#
## or FROM golang:alpine or some other base depending on need
#FROM alpine:latest AS runtime
#
##this seems dumb, but the libc from the build stage is not the same as the alpine libc
##create a symlink to where it expects it since they are compatable. https://stackoverflow.com/a/35613430/3105368
#RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
#
#WORKDIR /go/src/app
#
#COPY --from=build /go/src/app/main.go ./

FROM golang:alpine

ADD ./src /go/src/app

WORKDIR /go/src/app

RUN apk add --no-cache git mercurial \
    && go get -d \
    && apk del git mercurial

ENV PORT=3001

CMD ["go", "run", "main.go"]