FROM 5.6.29-alpine

# COMPOSER
RUN apk add --no-cache --virtual .persistent-deps \
  git openssh openssl tini bash
RUN echo "memory_limit=-1" > "$PHP_INI_DIR/conf.d/memory-limit.ini" \
 && echo "date.timezone=${PHP_TIMEZONE:-UTC}" > "$PHP_INI_DIR/conf.d/date_timezone.ini"
ENV PATH "/composer/vendor/bin:$PATH"
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV COMPOSER_VERSION 1.3.1
RUN curl -s -f -L -o /tmp/installer.php https://raw.githubusercontent.com/composer/getcomposer.org/2091762d2ebef14c02301f3039c41d08468fb49e/web/installer \
  && php -r " \
    \$signature = '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30'; \
    \$hash = hash('SHA384', file_get_contents('/tmp/installer.php')); \
    if (!hash_equals(\$signature, \$hash)) { \
        unlink('/tmp/installer.php'); \
        echo 'Integrity check failed, installer is either corrupt or worse.' . PHP_EOL; \
        exit(1); \
    }" \
  && php /tmp/installer.php --no-ansi --install-dir=/usr/bin --filename=composer --version=${COMPOSER_VERSION} \
  && rm /tmp/installer.php \
  && composer --ansi --version --no-interaction






# RUN set -ex; \
#   \
#   apt-get update; \
#   apt-get install -y \
#     libjpeg-dev \
#     libpng12-dev \
#   ; \
#   rm -rf /var/lib/apt/lists/*; \
#   \
#   docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
#   docker-php-ext-install gd mysqli opcache