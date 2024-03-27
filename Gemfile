source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"

gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "sidekiq", "~> 6.2"
gem 'pagy'
gem 'pg', '~> 1.2'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem "figaro"
gem "simple_form"
gem "devise"
gem "pundit", "~> 2.2"

gem "ransack"
gem "rubyzip"

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"
  gem "awesome_print"
  gem "rspec-rails"
  gem "solargraph"
  gem "faker"
  gem "factory_bot_rails"
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.3"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem 'sqlite3', '~> 1.4'
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "database_cleaner-active_record"
end
