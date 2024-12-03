all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
update:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build --force-recreate --remove-orphans
start:
	@docker-compose -f ./srcs/docker-compose.yml start
status:
	@docker-compose -f ./srcs/docker-compose.yml ps
logs:
	@docker-compose -f ./srcs/docker-compose.yml logs -f
stop:
	@docker-compose -f ./srcs/docker-compose.yml stop
down:
	@docker-compose -f ./srcs/docker-compose.yml down -v --remove-orphans
	@docker volume prune -f
	
re: down all
