require 'serverspec'
require 'docker'

# :backend can be either :exec or :ssh
# since we are running local we use :exec
set :backend, :exec
# Enable sudo for docker in fedora
set :disable_sudo, false

image = '65822d51a20e' #Docker::Image.build_from_dir('.')

set :os,
set :backend, :docker
set :docker_image, image.id
set :sudo_options, '-u root -i'
