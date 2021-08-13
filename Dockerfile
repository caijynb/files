FROM php:5.6.37-apache
MAINTAINER cjy0526 "1332794849@qq.com"

ADD src /var/www/html

# install gd requirement && install extensions
RUN apt-get update && apt-get install -y libgd-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd mbstring fileinfo exif \
    && mkdir /var/www/html/content

EXPOSE 80
