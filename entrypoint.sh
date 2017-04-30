if [ -n $XDEBUG_ON ]
then
    docker-php-ext-enable xdebug
fi

php-fpm -d"date.timezone=$DATE_TIMEZONE"