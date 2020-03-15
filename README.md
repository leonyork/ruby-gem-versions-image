# Ruby Gem Versions Image

Images for getting the versions for Ruby gems.

## Build

```docker build --build-arg RUBY_VERSION=2.7.0-alpine3.11 -t leonyork/ruby-gem-versions .```

## Test

```docker run leonyork/ruby-gem-versions rspec```