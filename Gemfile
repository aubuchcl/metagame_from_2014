source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '3.2.18'

# quard implementation
gem 'nifty-generators'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# Private Messages
gem 'simple-private-messages', '0.0.0', :git => 'git://github.com/jongilbraith/simple-private-messages.git'


gem 'pg'
gem 'bcrypt'
gem 'omniauth-steam'
gem 'figaro'
gem 'httparty'
gem 'json'
gem 'squeel'

group :production do
  gem 'newrelic_rpm'
  gem 'unicorn'
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails', '=2.14'
  gem 'launchy'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-spork'
  gem 'ruby_gntp'
end

group :test, :darwin do
  gem 'rb-fsevent'
end


group :test do
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON`
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
#
