name = inception
compose_file = srcs/docker-compose.yml
env_file = srcs/.env
wordpress_data = ~/data/wordpress
mariadb_data = ~/data/mariadb

all: start
	@echo "launch config for ${name}...\n"

build:
	@echo "Building configuration ${name}...\n"
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f $(compose_file) --env-file $(env_file) build

build-and-start:
	@echo "Starting containers for ${name}...\n"
	@docker-compose -f $(compose_file) --env-file $(env_file) up -d

start:
	@echo "Starting containers for ${name}..."
	@docker-compose -f $(compose_file) --env-file $(env_file) up -d

down:
	@echo "Stopping configuration for ${name}...\n"
	@docker-compose -f $(compose_file)  --env-file $(env_file) down

clean: down
	@echo "Cleaning configuration for ${name}...\n"
	@docker-compose -f $(compose_file) --env-file $(env_file) down --volumes --remove-orphans
	@sudo rm -rf $(wordpress_data)
	@sudo rm -rf $(mariadb_data)

fclean:
	@echo "Complete cleanse of all configurations docker\n"
	@docker-compose -f $(compose_file) --env-file $(env_file) down --volumes --remove-orphans
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf $(wordpress_data)
	@sudo rm -rf $(mariadb_data)

re:	fclean build-and-start
	@echo "Rebuild config for ${name}...\n"

.PHONY	: all build down re clean fclean
