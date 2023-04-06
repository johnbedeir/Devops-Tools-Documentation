FROM golang:1.17-alpine3.14

WORKDIR /app

COPY . .

RUN apk add --no-cache git && \
  go mod download && \
  go mod verify && \
  go get github.com/gin-gonic/gin/binding@v1.8.2

RUN go build -o main .

EXPOSE 8080

CMD ./main
