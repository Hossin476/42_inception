# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lshail <lshail@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/19 14:47:33 by lshail            #+#    #+#              #
#    Updated: 2024/05/21 13:39:54 by lshail           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y && \
	apt upgrade -y && \
	apt install mariadb-server -y && \
	mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld

ARG MYSQL_ROOT_PASSWORD
ARG WORDPRESS_DB_NAME
ARG MYSQL_USER
ARG MYSQL_ROOT_USER
ARG MYSQL_PASSWORD

COPY ./conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/start.sh /etc/start.sh

RUN sh /etc/start.sh

CMD ["mysqld_safe"]