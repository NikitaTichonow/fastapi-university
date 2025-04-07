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