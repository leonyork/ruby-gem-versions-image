#!/usr/bin/env sh
#######################################################################
# Build, test and push the images
# Creates a version for all numbered alpine versions that the Docker 
# hub api returns
#######################################################################
version=1.0.0
set -eux

# Ignore any versions that aren't numbered or alpine, and build and push 
docker run leonyork/docker-tags:1.0.0-curl-7.68.0 library/ruby \
        | grep -E '^[0-9.]+-alpine[0-9.]+$' \
        | xargs -I{RUBY_VERSION} -n1 \
        sh build-image.sh {RUBY_VERSION} $version-ruby{RUBY_VERSION}

#Push the latest version
sh build-image.sh alpine latest