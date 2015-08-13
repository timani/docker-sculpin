FROM alpine:latest
MAINTAINER Timani Tunduwani
RUN apk --update add tar git zip php-common php-iconv php-phar php-ctype php-xsl php-openssl php-json php-gd php-curl php-xml php-dom php-zip php-imap php-cgi fcgi
# Add Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install Sculpin
RUN curl -O https://download.sculpin.io/sculpin.phar; chmod +x sculpin.phar; mv sculpin.phar /usr/local/bin/sculpin
# Expose the port for the sculpin server
EXPOSE 8000
WORKDIR /var/www
