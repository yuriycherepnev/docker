FROM postgres:16

WORKDIR /app

COPY ./create_db.sh /app/create_db.sh

# Копируем SQL-файлы в директорию для инициализации базы данных
# При первом запуске контейнера Postgre автоматически выполняет все SQL-скрипты из этой папки в алфавитном порядке
COPY ./database/*.sql /docker-entrypoint-initdb.d/

# Делаем скрипт исполняемым
RUN chmod +x /app/create_db.sh

# Запускаем скрипт для модификации SQL файлов
RUN /app/create_db.sh