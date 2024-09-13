# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lshail <lshail@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/19 14:47:40 by lshail            #+#    #+#              #
#    Updated: 2024/05/18 13:31:17 by lshail           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install nginx openssl -y && \
    mkdir -p /etc/nginx/ssl

COPY ./conf/nginx.conf /etc/nginx/

COPY ./tools/start.sh /etc/start.sh

CMD ["sh", "/etc/start.sh"]