source 'https://rubygems.org'


if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end 

gem 'rails'
gem 'rake', '0.8.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'activeadmin'
gem "active_model_serializers", :git => "git://github.com/rails-api/active_model_serializers.git"
gem 'mysql2'
gem 'geocoder'
gem 'haml-rails'
gem 'sass'
gem 'simple_form'
gem 'carrierwave', :git => 'git://github.com/jnicklas/carrierwave.git'
gem 'rmagick'
gem 'backbone-on-rails'
gem 'sass-rails',   '~> 3.2.3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.2.1.1'
  gem 'haml_coffee_assets'
end

group :development do
  gem 'capistrano'
end

gem 'jquery-rails'

group :test do
  gem 'rspec-rails'
  gem 'spork-rails'
  gem 'factory_girl_rails'
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
