FROM centos:centos6

# install utilities 
RUN yum -y install vim wget curl git msmtp
 
# install PHP 5.6
RUN yum -y install php5-fpm php-gd php-ldap php-sqlite \
php5-intl php5-curl php5-cli php5-xdebug php-mysql php-pecl-sqlite \
php-pearphp-mcrypt php-opcache php-xml php-xmlrpc 

# Clean up YUM when done.
RUN yum clean all

# Add Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && chmod +x /usr/local/bin/composer

# Install Sculpin
RUN composer global require sculpin/sculpin:2.0.x-dev

# Move to the directory were the sculpin PHP files will be located
WORKDIR /var/www 
