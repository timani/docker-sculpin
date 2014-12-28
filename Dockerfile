FROM php:5.5
MAINTAINER Timani tunduwani "timani at email.com"
# Install git
RUN apt-get update; apt-get install -y vim wget git 
# Add Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install Sculpin
RUN curl -O https://download.sculpin.io/sculpin.phar; chmod +x sculpin.phar; mv sculpin.phar /usr/local/bin/sculpin
# Expose the port for the sculpin server
EXPOSE 8000
# Move to the directory were the sculpin PHP files will be located
WORKDIR /var/www 
