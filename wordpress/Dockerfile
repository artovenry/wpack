FROM wordpress:latest


RUN apt-get update && apt-get install -y sudo less
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
COPY wp-su.sh /bin/wp
RUN chmod +x /bin/wp-cli.phar /bin/wp
COPY 000-default.conf /etc/apache2/sites-available

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# RUN npm -g install redis
# ENV NODE_PATH /usr/local/lib/node_modules
#
# ENTRYPOINT ["node", "app.js"]
# CMD [
#   php wp-cli.phar core download
#   php wp-cli.phar core config
#   php wp-cli.phar core install
# ]
