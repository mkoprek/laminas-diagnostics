#!/bin/bash

PHP_VERSION="$1"

if ! [[ "${PHP_VERSION}" =~ 8\.4 ]]; then
  echo "memcached is only installed from pecl for PHP 8.3, ${PHP_VERSION} detected."
  exit 0;
fi

set +e
apt install make

pecl install memcached
echo "extension=memcached.so" > /etc/php/${PHP_VERSION}/mods-available/memcached.ini
phpenmod -v ${PHP} -s cli memcached