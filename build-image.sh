#!/usr/bin/env sh
#######################################################################
# Build, test and push an image
# First argument is the ruby version to use
# Second argument is the image tag
#######################################################################

set -eux

if [ -z "$1" ]
then
    echo "You must specify the version of the docker image library/ruby to use"
    exit 1
fi

if [ -z "$2" ]
then
    echo "You must specify the image tag to use"
    exit 1
fi

export RUBY_VERSION=$1;
export IMAGE_TAG=$2;
docker-compose build 

# Test that it's working by making surt we can get some release versions
docker-compose run ruby-gem-versions rspec | grep '1.0.0'

# Push to the docker registry
docker-compose push