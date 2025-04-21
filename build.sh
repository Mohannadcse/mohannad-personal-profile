#!/bin/bash

# Upgrade RubyGems before anything else
gem update --system --no-document

# Ensure bundler is up-to-date and locked in
gem install bundler -v 2.4.22

# Install dependencies
bundle config set path 'vendor/bundle'
bundle install

# Build the site
bundle exec jekyll build
