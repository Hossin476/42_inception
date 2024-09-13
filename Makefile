# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lshail <lshail@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/19 14:47:18 by lshail            #+#    #+#              #
#    Updated: 2024/05/21 18:13:36 by lshail           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

mariadb_folder := ${HOME}/data/mariadb

wp_folder := ${HOME}/data/wordpress

UP = docker-compose up -d

DOWN = docker-compose down 

START = docker-compose start

STOP = docker-compose stop

all : up

up:
	@if [ ! -d "$(mariadb_folder)" ]; then \
		mkdir -p $(mariadb_folder); \
	fi

	@if [ ! -d "$(wp_folder)" ]; then \
		mkdir -p $(wp_folder); \
	fi
	cd ./srcs && $(UP)

start:
	cd ./srcs && $(START)

stop:
	cd ./srcs && $(STOP)

clean:
	cd ./srcs && $(DOWN)

fclean: clean
	docker system prune -af

	@volumes=$$(docker volume ls -q); \
	if [ -n "$$volumes" ]; then \
		docker volume rm $$volumes; \
	fi

	@networks=$$(docker network ls -q --filter type=custom); \
	if [ -n "$$networks" ]; then \
		docker network rm $$networks; \
	fi

	rm -rf $(mariadb_folder) $(wp_folder)

re: fclean all

.PHONY: all build clean fclean re