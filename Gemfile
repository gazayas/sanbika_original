source 'https://rubygems.org'
ruby "2.7.0"

gem 'rails', '~> 6.0.3'
gem 'actionview', '>= 5.2.4.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'

gem 'devise'
gem 'figaro'
gem 'bootstrap-sass'
gem 'kaminari', '~> 1.2.1'
gem 'friendly_id', '~> 5.1.0'
gem 'database_cleaner', '~> 1.5.0'
gem 'rake', '~> 12.3.3'

gem 'pdfkit'
gem 'wkhtmltopdf'

gem 'therubyracer'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'teaspoon-mocha'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'brakeman', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
