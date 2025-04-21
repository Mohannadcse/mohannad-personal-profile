source "https://rubygems.org"
# Prevent issues with outdated RubyGems on Netlify
ENV["RUBYGEMS_GEMDEPS"] = "1"

# Core dependencies
gem "jekyll", "~> 3.5"
gem "jekyll-scholar"
gem "minimal-mistakes-jekyll"
gem "kramdown-parser-gfm"

# Compatibility fix for Netlify build issues
gem "ffi", "< 1.17"

# Jekyll plugins
group :jekyll_plugins do
  gem "jekyll-archives"
end
