FROM alpine:3.7
MAINTAINER Boris Karaoglanov "boris@opsmag.com"

# ensure www-data user exists
RUN set -x \
	&& addgroup -g 82 -S www-data \
	&& adduser -u 82 -D -S -G www-data www-data

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk --update add \
        php7-dom \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-intl \
        php7-json \
        php7-mbstring \
	    php7-mcrypt \
        php7-mysqlnd \
        php7-opcache \
        php7-pdo \
        php7-pdo_mysql \
        php7-posix \
        php7-session \
        php7-tidy \
        php7-xml \
        php7-zip \
        php7-mysqli \
    && rm -rf /var/cache/apk/*

#Copy special configs
COPY /configs/php.ini         /etc/php7/php.ini
COPY /configs/pphp-fpm.conf    /etc/php7/php-fpm.conf
COPY /configs/www.conf        /etc/php7/php-fpm.d/www.conf

WORKDIR /var/www/html

#Set port
EXPOSE 9000

CMD ["php-fpm7", "-F"]
