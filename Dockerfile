# Используем официальный образ Debian Bullseye
FROM debian:bullseye

# Установка необходимых пакетов
RUN apt-get update && apt-get install -y curl \
    bind9-dnsutils \
    vim \
    bash \
    rsync \
    nginx-full \
    php7.4 \
    php7.4-cli \
    php7.4-mbstring \
    php7.4-curl \
    php7.4-xml \
    php7.4-zip \
    php7.4-mysql \
    php7.4-imagick \
    php7.4-memcached \
    php7.4-gd \
    php-pear \
    php-memcache \ 
    php-memcached \
    php-redis \
    php-db \
    memcached \
    apache2 \
    libapache2-mod-php7.4 \
    mariadb-server \
    mariadb-client \
    ssmtp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/journal/var && chmod 777 /opt/journal/var -R && mkdir -p /etc/ssmtp
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R www-data:www-data /opt/journal

# Копируем конфигурационные файлы и данные
COPY docker/php.ini /etc/php/7.4/apache2/php.ini
COPY docker/apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY docker/default /etc/nginx/sites-available/default
#COPY docker/ssl /etc/nginx/sites-available/ssl
COPY mysql-schema.sql /tmp/mysql-schema.sql
COPY backend /opt/journal/backend
COPY public_html /opt/journal/public_html
COPY docker/ssmtp.sh /tmp/ssmtp.sh

# Удаляем лишний файл и настраиваем права доступа
RUN cat /dev/null > /etc/apache2/ports.conf 
RUN chmod +x /tmp/ssmtp.sh

# Настраиваем Apache
RUN a2enmod php7.4 && a2enmod expires && a2enmod headers && a2enmod rewrite  

# Открываем порты
EXPOSE 80

# Запускаем сервисы и инициализируем базу данных с HEALTHCHECK
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD service apache2 status || exit 1
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD service nginx status || exit 1
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD service mariadb status || exit 1
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
    CMD service memcached status || exit 1


# Запускаем сервисы и инициализируем базу данны
CMD service memcached start && service mariadb start &&service apache2 start && service nginx start && mysqladmin --wait=30 ping && mysql -u root < /tmp/mysql-schema.sql && /tmp/ssmtp.sh && while true; do sleep 1; done
