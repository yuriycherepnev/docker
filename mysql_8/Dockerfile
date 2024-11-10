FROM mysql:8.0

WORKDIR /app

COPY ./create_db.sh /app/create_db.sh

# Копируем SQL-файлы в директорию для инициализации базы данных
COPY ./database/*.sql /docker-entrypoint-initdb.d/

# Копируем конфиги mysql
COPY ./my.cnf /etc/mysql/conf.d/my.cnf

# Делаем скрипт исполняемым
RUN chmod +x /app/create_db.sh

# Запускаем скрипт для модификации SQL файлов
RUN /app/create_db.sh

