# Stage 1: сборка
FROM golang:1.24-alpine AS builder

WORKDIR /app

# Копируем go.mod и go.sum (если есть), чтобы кэшировать зависимости
COPY go.mod ./

# Загружаем зависимости
RUN go mod download

# Копируем весь код в контейнер
COPY . .

# Собираем бинарник
RUN go build -o ascii-art-web ./main.go

# Stage 2: минимальный образ для запуска
FROM alpine:latest

WORKDIR /app

# Копируем бинарь из билдера
COPY --from=builder /app/ascii-art-web .

# Копируем папки с шаблонами и статикой
COPY --from=builder /app/templates ./templates
COPY --from=builder /app/static ./static
COPY --from=builder /app/banners ./banners


# Открываем порт 8080
EXPOSE 8080

# Запускаем приложение
CMD ["./ascii-art-web"]
