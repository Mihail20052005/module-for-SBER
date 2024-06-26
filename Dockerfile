# Используем официальный образ Node.js
FROM node:18.15.0

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файлы package.json и yarn.lock
COPY package.json yarn.lock ./

# Устанавливаем зависимости
RUN yarn install

# Копируем остальные файлы проекта в рабочую директорию
COPY . .

# Указываем переменные окружения
ADD .env.sample .env
# Открываем порт, на котором будет работать приложение
EXPOSE 3000

# Команда для запуска приложения
CMD ["yarn", "start"]

