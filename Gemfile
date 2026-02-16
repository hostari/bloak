source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in bloak.gemspec.
gemspec

group :development do
  gem 'pg'
  gem 'puma'
  gem 'ostruct'     # Required for Ruby 4.0+
  gem 'benchmark'   # Required for Ruby 4.0+

  gem 'rubocop', '1.19.1'
  gem 'rubocop-performance', '1.11.5'
  gem 'rubocop-rails', '2.11.3'
  gem 'rubocop-rspec', '~> 2.4.0'
end

# To use a debugger
# gem 'byebug', group: [:development, :test]
