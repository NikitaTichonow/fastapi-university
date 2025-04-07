help:  ## Показать доступные команды
	@echo "Доступные команды:"
	@echo "  make run            - Запустить сервер разработки"
	@echo "  make up-heads       - Применить миграции"
	@echo "  make up 			 - Запустить database через docker"
	@echo "  make down           - Удалить database через docker"
	@echo "  make black          - Запустить black"

run:
	uvicorn main:app --reload

up-heads:
	alembic upgrade heads

up:
	docker compose -f docker-compose-local.yaml up -d

down:
	docker compose -f docker-compose-local.yaml down && docker network prune --force

black: ## 
	black . --exclude=venv