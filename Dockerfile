# Используем официальный образ Python из Docker Hub
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файл зависимостей и устанавливаем их
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Копируем все файлы проекта в рабочую директорию
COPY . .

# Определяем переменную окружения для Flask
ENV FLASK_APP=main.py

# Открываем порт для приложения
EXPOSE 5000

# Запускаем Flask приложение с использованием Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]