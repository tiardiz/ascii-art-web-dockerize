FROM golang:1.24-alpine AS builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY . .

 # Собираем бинарник
RUN go build -o ascii-art-web ./main.go

FROM alpine:latest

LABEL maintainer="ardaktleules11.com"
LABEL version="1.0"
LABEL description="ASCII Art web server in Go"

WORKDIR /app

# Копируем бинарь из билдера
COPY --from=builder /app/ascii-art-web .

# Копируем папки с шаблонами и статикой
COPY --from=builder /app/templates ./templates
COPY --from=builder /app/static ./static
COPY --from=builder /app/banners ./banners


EXPOSE 8080

CMD ["./ascii-art-web"]
