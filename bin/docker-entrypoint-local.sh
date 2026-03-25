#!/bin/bash
set -e

echo "==> Installing system dependencies..."
apt-get update -qq
apt-get install -y --no-install-recommends build-essential git imagemagick python3-pip nodejs npm

echo "==> Installing Python dependencies..."
pip3 install nbconvert --break-system-packages

echo "==> Installing gems..."
bundle install

echo "==> Starting Jekyll..."
bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload --force_polling
