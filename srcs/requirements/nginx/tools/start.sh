# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lshail <lshail@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/02 14:19:06 by lshail            #+#    #+#              #
#    Updated: 2024/05/22 15:45:25 by lshail           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/bash



openssl req -x509 -new -nodes -out /etc/nginx/ssl/lshail.crt -keyout /etc/nginx/ssl/private.key -subj "/C=MA/L=Khouribga/O=42/CN=lshail.42.fr/UID=lshail"

nginx -g "daemon off;"