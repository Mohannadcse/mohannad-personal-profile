#!/bin/bash

echo "👉 Installing correct bundler version..."
gem install bundler -v 2.4.22

echo "👉 Installing project gems..."
bundle config set path 'vendor/bundle'
bundle install

echo "👉 Building the Jekyll site..."
bundle exec jekyll build
