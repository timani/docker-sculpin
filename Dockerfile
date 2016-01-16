FROM alpine:latest
MAINTAINER Timani Tunduwani
RUN apk --update add fcgi git tar zip php-common php-iconv php-phar php-ctype php-xsl php-openssl php-json php-gd php-curl php-xml php-dom php-zip php-imap php-cgi
# Add Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install Sculpin
RUN curl -O https://download.sculpin.io/sculpin.phar; chmod +x sculpin.phar; mv sculpin.phar /usr/local/bin/sculpin
# Expose the port for the sculpin server
EXPOSE 8000
ENTRYPOINT /var/www
# Clean APK cache
RUN rm -rf /var/cache/apk/*
