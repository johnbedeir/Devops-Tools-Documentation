FROM golang:1.17-alpine3.14

WORKDIR /app

COPY . .

RUN go mod download && \
  go mod verify && \
  go build -o survey .

CMD [ "./survey" ]

EXPOSE 8080
