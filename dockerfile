From		debian:buster

LABEL		Arapaill <arapaill@student.s19.fr>

RUN apt-get update && \
apt-get install -y nginx && \
apt-get install -y wget && \
apt-get install -y curl && \
apt-get install -y openssl && \
apt-get install -y mariadb-server mariadb-client && \
apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline && \
apt-get install -y php-mbstring php-zip php-gd && \
apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

COPY ./src/default.conf .
COPY ./src/init.sh .
COPY ./src/wp-config.php .
COPY ./src/config.inc.php .
