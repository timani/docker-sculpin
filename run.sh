#!/bin/sh
cd /var/www
git clone https://github.com/sculpin/sculpin-blog-skeleton.git /var/www/alpine-sculpin
cd /var/www/alpine-sculpin
sculpin install && sculpin generate --watch --server
