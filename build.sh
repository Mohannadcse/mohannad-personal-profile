#!/bin/bash

echo "👉 Installing bundler version 2.4.22"
gem install bundler -v 2.4.22

echo "👉 Installing gems"
bundle _2.4.22_ config set path 'vendor/bundle'
bundle _2.4.22_ install

echo "👉 Building Jekyll site"
bundle _2.4.22_ exec jekyll build
