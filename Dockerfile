FROM php:7.1-fpm

CMD ["php-fpm -d\"date.timezone=$DATE_TIMEZONE\""]