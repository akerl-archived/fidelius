path = File.dirname(ENV['BUNDLE_GEMFILE'] || '.')
ruby File.read(File.join(path, '.circle-ruby')).chomp
source 'https://rubygems.org'

gem 'redis', '~> 4.0.0'
gem 'sinatra', '~> 2.0.0'
gem 'thin', '~> 1.7.0'
gem 'zxcvbn-ruby', '~> 0.1.0'

group :development do
  gem 'codecov', '~> 0.1.1'
  gem 'fuubar', '~> 2.3.0'
  gem 'goodcop', '~> 0.5.0'
  gem 'rake', '~> 12.3.0'
  gem 'rspec', '~> 3.8.0'
  gem 'rubocop', '~> 0.59.0'
end
