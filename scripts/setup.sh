set -e

apt-get update && apt-get install -y libcurl3-dev zlib1g-dev
docker-php-ext-install curl zip

pecl install xdebug-2.5.0

EXPECTED_SIGNATURE=$(php -r "echo file_get_contents('https://composer.github.io/installer.sig');")
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
rm composer-setup.php
mv composer.phar /usr/bin/composer
chmod +x /usr/bin/composer

apt-get remove -y libcurl3-dev zlib1g-dev
apt-get clean
