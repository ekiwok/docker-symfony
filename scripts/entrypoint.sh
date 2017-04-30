#!/bin/bash

if [ -n "${XDEBUG_ON}" ]; then
    docker-php-ext-enable xdebug
    echo "Xdebug enabled."
else
    echo "Xdebug disabled."
fi

php-fpm -d"date.timezone=$DATE_TIMEZONE"