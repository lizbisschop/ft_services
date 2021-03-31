#!/bin/bash

php -S 0.0.0.0:5050 -t /usr/share/webapps

#!/bin/sh

# cd /www

# php-fpm7

# # if ! $(wp core is-installed); then
#     wp core download
#     cp /tmp/wp-config.php /www
#     wp core install --title=ft_services --url=192.168.99.129:5050 --admin_user=mysql --admin_password=password --admin_email=mysql@student.codam.nl --skip-email
#     # wp option update blogdescription "Welkom to my amazing WordPress website"
#     # wp post create --post_type=post --post_title='Hello, evaluator!' --post_status=publish
#     # wp user create swaan smiller@student.codam.nl --user_pass=swaanpass --role=editor
#     # wp user create tessa tclement@student.codam.nl --user_pass=tessapass --role=author
#     # wp user create britt bsomers@student.codam.nl --user_pass=brittpass --role=author
#     chown -R www:www /www
# # fi

# nginx -g "daemon off;"