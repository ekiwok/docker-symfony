FROM php:7.1-fpm

COPY base.ini /etc/php/
COPY entrypoint.sh entrypoint.sh
COPY setup.sh setup.sh

RUN setup.sh && rm -f setup.sh

CMD "entrypoint.sh"