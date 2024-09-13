# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lshail <lshail@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/02 14:19:18 by lshail            #+#    #+#              #
#    Updated: 2024/05/21 16:18:14 by lshail           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

service mariadb start

A="CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME};"
B="CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
C="GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
D="ALTER USER root@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
E="FLUSH PRIVILEGES;"

echo $A$B$C$D$E > maria_file.sql

mariadb < maria_file.sql