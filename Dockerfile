FROM centos:7
MAINTAINER timani tunduwani

# Install PHP and Percona (MySQL) client stuff and the latest stable PHP.
RUN yum -y install php php-gd 

RUN
  yum update -y && \
  yum install -y epel-release && \
  yum install -y yum-utils && \
  yum clean all

# Add Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Install Sculpin
RUN curl -O https://download.sculpin.io/sculpin.phar; chmod +x sculpin.phar; mv sculpin.phar /usr/local/bin/sculpin
# Expose the port for the sculpin server
EXPOSE 8000
# Move to the directory were the sculpin PHP files will be located
WORKDIR /var/www
