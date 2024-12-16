run:
	sudo mkdir -p ~/data/db ~/data/web
	sudo chmod 700 ~/data/db && sudo chmod +x ~/data/web
	docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker compose -f srcs/docker-compose.yml down -v --rmi all
	sudo rm -rf ~/gdaignea/data/db ~/gdaignea/data/web

start:
	@docker compose -f ./srcs/docker-compose.yml start
status:
	@docker compose -f ./srcs/docker-compose.yml ps
logs:
	@docker compose -f ./srcs/docker-compose.yml logs -f
stop:
	@docker compose -f ./srcs/docker-compose.yml stop
down:
	@docker compose -f ./srcs/docker-compose.yml down -v --remove-orphans
	@docker volume prune -f

re: clean run