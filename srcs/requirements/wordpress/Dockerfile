# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lshail <lshail@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/19 14:47:53 by lshail            #+#    #+#              #
#    Updated: 2024/05/21 16:18:26 by lshail           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y php7.4 php-fpm php-mysql mariadb-client wget && \
    mkdir -p /run/php/ && \
    chown -R www-data:www-data /run/php/

COPY ./tools/start.sh /etc/start.sh
    
CMD ["sh", "/etc/start.sh"]