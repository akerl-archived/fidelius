path = File.dirname(ENV['BUNDLE_GEMFILE'] || '.')
ruby File.read(File.join(path, '.circle-ruby')).chomp
source 'https://rubygems.org'

gem 'redis', '~> 4.1.0'
gem 'sinatra', '~> 2.0.0'
gem 'thin', '~> 1.7.0'
gem 'zxcvbn-ruby', '~> 1.0.0'

group :development do
  gem 'codecov', '~> 0.1.1'
  gem 'fuubar', '~> 2.4.1'
  gem 'goodcop', '~> 0.7.1'
  gem 'rake', '~> 13.0.0'
  gem 'rspec', '~> 3.8.0'
  gem 'rubocop', '~> 0.76.0'
end
