FROM php:5.6.37-apache
MAINTAINER cjy0526 "1332794849@qq.com"

ENV MAXSIZE=5000M USER=fileadmin PASSWORD=fileadmin

ADD src /var/www/html

# change php.ini
RUN sed -i "s/upload_max_filesize = 2M/upload_max_filesize = ${MAXSIZE}/" $PHP_INI_DIR/php.ini-production \
    && sed -i "s/post_max_size = 8M/post_max_size = ${MAXSIZE}/" $PHP_INI_DIR/php.ini-production \
    && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# install gd requirement && install extensions
RUN apt-get update && apt-get install -y libgd-dev libzip-dev zip  \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install gd mbstring fileinfo exif zip 


    
# set username and password for admin.php which can manage files
RUN cd /var/www/html/ && mkdir content && chmod -R 777 content \
    && sed -i "22s/''/'$USER'/" fileadmin.php \
    && sed -i "23s/''/'$PASSWORD'/" fileadmin.php 


EXPOSE 80
