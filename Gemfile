source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"

gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

gem "figaro"
gem "simple_form"
gem "devise"

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"
  gem "awesome_print"
  gem "rspec-rails"
  gem "mailcatcher"
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.3"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
