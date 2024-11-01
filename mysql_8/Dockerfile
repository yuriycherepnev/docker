FROM mysql:8.0

# Копируем SQL-файлы в директорию для инициализации базы данных
COPY ./my.cnf /etc/mysql/conf.d/my.cnf
COPY ./database/*.sql /docker-entrypoint-initdb.d/
