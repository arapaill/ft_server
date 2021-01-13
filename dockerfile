From		debian:buster

LABEL		Arapaill <arapaill@student.s19.fr>

RUN			apt-get update
RUN			apt-get upgrade -y
RUN			apt-get -y install wget
RUN			apt-get -y install nginx
RUN			apt-get -y install mariadb-server
RUN			apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring
RUN			wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN			tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN			mv phpMyAdmin-5.0.1-english phpmyadmin
RUN			wget https://wordpress.org/latest.tar.gz
RUN			tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN 		openssl req -x509 -nodes -days 365 -subj "/C=BE/ST=Belgium/L=Bruxelles/O=innoaca/OU=19Bruxelles/CN=arapaill" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;
RUN 		chown -R www-data.www-data /var/www/
RUN 		chmod -R 755 /var/www/*

COPY		./src/default.conf .
COPY		./src/init.sh ./
COPY		./src/config.inc.php phpmyadmin
COPY		./src/wp-config.php /var/www/html

CMD			bash init.sh