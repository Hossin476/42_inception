# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lshail <lshail@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/02 14:19:12 by lshail            #+#    #+#              #
#    Updated: 2024/05/21 16:02:33 by lshail           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!bin/bash

until mysqladmin ping --silent  -u${MYSQL_USER} -p${MYSQL_PASSWORD} -P${MYSQL_PORT} -h${MYSQL_DATABASE};
do
    echo "Waiting for MariaDB to be ready..."
    sleep 1
done

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then

    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
    mkdir -p /var/www/html/wordpress
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    cd /var/www/html/wordpress
    wp core download --allow-root --path=/var/www/html/wordpress
    wp config create --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --dbhost=${MYSQL_DATABASE} --allow-root --path=/var/www/html/wordpress
    wp core install --url=${WORDPRESS_URL} --title="Lshail's Site" --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root --path=/var/www/html/wordpress
    wp user create ${SECOND_USER_NAME} ${SECOND_USER_EMAIL} --role=${SECOND_USER_ROLE} --user_pass=${SECOND_USER_PASSWORD} --allow-root --path=/var/www/html/wordpress 
fi

sed -i -e '/^listen\s*=.*$/c\' -e 'listen = 9000' /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F
