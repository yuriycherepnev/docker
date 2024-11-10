#!/bin/bash

SQL_DIR="/docker-entrypoint-initdb.d"

# Проверка существования папки с SQL файлами
if [ ! -d "$SQL_DIR" ]; then
  echo "Ошибка: Папка '$SQL_DIR' не найдена."
  exit 1
fi

# Перебираем все файлы в папке с расширением .sql
for FILE in "$SQL_DIR"/*.sql; do
  # Проверка, является ли это файлом
  if [ -f "$FILE" ]; then
    # Извлечение имени базы данных из имени файла
    DB_NAME=$(basename "$FILE" .sql)
    
    # Проверка, содержится ли уже нужная команда в первой строке
    if head -n 1 "$FILE" | grep -q "CREATE DATABASE"; then
      echo "Команда 'CREATE DATABASE' уже присутствует в файле '$FILE'."
    else
      # Добавление строк в начало файла
      sed -i "1i CREATE DATABASE IF NOT EXISTS $DB_NAME;\nUSE $DB_NAME;\n" "$FILE"
      echo "Строки добавлены в файл '$FILE'."
    fi
  fi
done
