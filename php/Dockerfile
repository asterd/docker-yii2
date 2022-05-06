FROM php:7.4.1-fpm-alpine3.11

MAINTAINER Dario D''Urzo <duda84@gmail.com>

ENV TIMEZONE Europe/Rome

RUN apk upgrade --update && apk --no-cache add \
    autoconf tzdata file g++ gcc binutils isl libatomic libc-dev musl-dev make re2c libstdc++ libgcc oniguruma-dev libzip-dev libcurl curl-dev build-base mpc1 mpfr4 gmp libgomp coreutils freetype-dev libjpeg-turbo-dev libltdl libmcrypt-dev libpng-dev openssl-dev libxml2-dev expat-dev \
    && docker-php-ext-install -j$(nproc) iconv mysqli pdo pdo_mysql curl bcmath mbstring json xml zip opcache

RUN pecl install mcrypt-1.0.4 \
    && docker-php-ext-enable mcrypt;

RUN docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd

# TimeZone
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
&& echo "${TIMEZONE}" > /etc/timezone

# Install Composer && Assets Plugin
RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && apk del tzdata \
    && rm -rf /var/cache/apk/*

EXPOSE 9000

CMD ["php-fpm"]