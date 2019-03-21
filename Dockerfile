FROM golang:alpine

ADD ./src /go/src/

WORKDIR /go/src/app

RUN apk add --no-cache git mercurial \
    && go get -d \
    && apk del git mercurial

ENV PORT=3001

CMD ["go", "run", "app/main.go"]
