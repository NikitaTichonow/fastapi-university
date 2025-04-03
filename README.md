Для создания database postgres с помощью docker-compose, создаем файл docker-compose-local.yaml далее:
```
version: "3.0"
services:
  db:
    container_name: "db"
    image: postgres:14.1-alpine
    restart: always
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=postgres
    ports:
      - "5432:5432"
    networks:
      - custom
networks:
  custom:
    driver: bridge
```

- Дальше вводим команду в терминале: ```docker-compose -f docker-compose-local.yaml up -d``` данная команда используется для запуска контейнеров, определённых в файле docker-compose-local.yaml, в фоновом режиме (detached mode).
```
docker-compose: это инструмент для определения и управления многоконтейнерными Docker-приложениями.

-f docker-compose-local.yaml: указывает, что нужно использовать файл docker-compose-local.yaml вместо стандартного docker-compose.yml.

up: эта команда создаёт и запускает контейнеры, указанные в файле конфигурации.

-d: флаг, который запускает контейнеры в фоновом режиме, позволяя вам продолжать использовать терминал.
```


Для создания миграций, если файла alembic.ini ещё нет, нужно запустить в терминале команду:
 
```
alembic init migrations
```
 
После этого будет создана папка с миграциями и конфигурационный файл для алембика.
 
- В alembic.ini нужно задать адрес базы данных, в которую будем катать миграции.
- Дальше идём в папку с миграциями и открываем env.py, там вносим изменения в блок, где написано 

```
from myapp import mymodel
```
 
- Дальше вводим: ```alembic revision --autogenerate -m "comment"```
- Будет создана миграция
- Дальше вводим: ```alembic upgrade heads```