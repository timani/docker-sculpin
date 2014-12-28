docker-sculpin
==============

A basic docker image for Sculpin, the PHP static site generator

Building the base image
-----------------------

To create the base image `timani/sculpin`, execute the following command on the tutum-docker-php folder:

    docker build -t timani/sclupin .


Running your Sculpin docker image
------------------------------------

Start your image binding the external ports 8000 in all interfaces to your container:

    docker run -t -i -p 8000:8000 sculpin /bin/bash

Test your deployment:

    curl http://localhost:8000

Hello world!


Loading your own Sculpin site
-----------------------------------

This image can be used as a base image for your Sculpin site. Create a new `Dockerfile` in your 
PHP application folder with the following contents:

    FROM timani/sclupin

After that, build the new `Dockerfile`:

    docker build -t username/my-sculpin-site .

And test it:

    docker run -d -p 8000:8000 username/my-sculpin-site

Test your deployment:

    curl http://localhost:8000

That's it!


Loading your custom PHP application with composer requirements
--------------------------------------------------------------

Create a Dockerfile like the following:

    FROM tutum/apache-php
    RUN apt-get update && apt-get install -yq git && rm -rf /var/lib/apt/lists/*
    RUN rm -fr /app
    ADD . /app
    RUN composer install

- Replacing `git` with any dependencies that your composer packages might need.
- Add your php application to `/var/www`
