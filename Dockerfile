FROM php:5.6-apache

RUN set -ex; \
	\
	apt-get update; \
	apt-get install -y \
    # Necessary for WP
		libjpeg-dev \
    libpng12-dev \
    # Necessary for wp-cli
    sudo less mysql-client \
	; \
	rm -rf /var/lib/apt/lists/*; \
	\
  # Enable some PHP extensionsv for WP
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-install gd mysqli opcache


# setup opcache options into PHP's configuration
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN a2enmod rewrite expires


VOLUME /var/www/html

# Add WP-CLI
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY ./docker/wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar
ARG wp_version
RUN mkdir /etc/wp-cli
COPY ./wp-cli/${wp_version}.yml /etc/wp-cli

# COPY ./docker/docker-php-entrypoint /bin
# # overwirtes 5.6-apache's entrypoint
# # ENTRYPOINT ["docker-php-entrypoint", "install_wp"]
