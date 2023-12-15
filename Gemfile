source "https://rubygems.org"

ruby "3.2.2"

# Core Rails gem
gem "rails", "~> 7.1.0"

# PostgreSQL adapter
gem "pg", "~> 1.1"

# Puma as the app server
gem "puma", ">= 5.0"

# Speed up boot times by caching expensive operations
gem "bootsnap", require: false

# Handle Cross-Origin Resource Sharing (CORS), if necessary
gem 'rack-cors', require: 'rack/cors'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'sprockets-rails'

group :development, :test do
  # Debugging tool
  gem "debug", platforms: %i[ mri x64_mingw mingw ]
end

group :development do
  # Load environment variables from .env file
  gem 'dotenv-rails'
end
