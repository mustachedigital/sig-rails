source 'https://rubygems.org'

# SPREE PATH /Users/ishank/.rvm/gems/ruby-2.1.0/bundler/gems/spree-2232af34fa19
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'spree', github: 'spree/spree', branch: '3-0-stable'
gem 'spree_gateway', :git => 'https://github.com/spree/spree_gateway.git', :branch => '3-0-stable'
gem 'spree_auth_devise', :git => 'https://github.com/spree/spree_auth_devise.git', :branch => '3-0-stable'
gem "spree_analytics_dashboard", github: "w3villa/spree_analytics_dashboard"
# Use mysql as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'less-rails'
gem 'slim-rails'
gem 'sidekiq'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'roo', '~> 2.0.0'
gem 'aws-sdk', '< 2.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'rvm-capistrano'
gem 'curb'
gem 'puma'

# group :development, :test do
#   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
#   gem 'byebug'

#   # Access an IRB console on exception pages or by using <%= console %> in views
#   gem 'web-console', '~> 2.0'

#   # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
#   gem 'spring'
# end
gem 'quiet_assets', group: :development
group :development do
  gem 'capistrano', '2.15.5'
  gem 'capistrano-unicorn', :require => false
end