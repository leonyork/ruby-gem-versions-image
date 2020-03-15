#!/usr/bin/env sh
#######################################################################
# Get the versions for an ruby gem
# First argument is the ruby gem name (e.g. rspec)
#######################################################################

if [ -z "$1" ]
then
    echo "You must specify a the ruby gem name (e.g. rspec)"
    exit 1
fi

gem search "^$1$" --all | grep -o '\((.*)\)$' | tr -d '() ' | tr ',' "\n"