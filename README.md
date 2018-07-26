# Docker image PHP-FPM

This docker image is base for php-fpm on Linux Alpine at version 3.7.

This docker image is always build with latest php-fpm 7 version / minor version 
To build based of this image please reference it:
```
FROM alpine:3.7
```
Ideal for: Custom application that require PHP-FPM, WordPress, Magento, and codecanyon scripts. Most of applications will work right out of a box.

Configurations can be modified in *configs* directory

User and group www-data is created within build of docker image.
```
RUN set -x \

&& addgroup -g 82 -S www-data \

&& adduser -u 82 -D -S -G www-data www-data
```

### Artifacts
docker push opsmag/php-fpm

https://hub.docker.com/r/opsmag/php-fpm/

https://www.opsmag.com/docker

### Authors and contributors: 
Boris Karaoglanov

contact@opsmag.com

https://www.opsmag.com/boris