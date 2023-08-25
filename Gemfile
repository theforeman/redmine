source 'https://rubygems.org'

ruby '>= 2.3.0', '< 2.7.0' if Bundler::VERSION >= '1.12.0'
gem "bundler", ">= 1.5.0"

gem 'rails', '5.2.5'
gem "rouge", "~> 3.3.0"
gem "request_store", "1.0.5"
gem "mini_mime", "~> 1.0.1"
gem "actionpack-xml_parser"
gem "roadie-rails", "~> 1.3.0"
gem 'marcel'
gem "mail", "~> 2.7.1"
gem "csv", "~> 3.0.1" if RUBY_VERSION >= "2.3" && RUBY_VERSION < "2.6"

gem "nokogiri", (RUBY_VERSION >= "2.3" ? "~> 1.10.0" : "~> 1.9.1")
gem "loofah", '2.19.1'
gem "i18n", "~> 0.7.0"
gem "xpath", "< 3.2.0" if RUBY_VERSION < "2.3"

# TODO: Remove the following line when #32223 is fixed
gem "sprockets", "~> 3.7.2"

# TODO: Remove the following line when #32223 is fixed
gem "sprockets", "~> 3.7.2"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :x64_mingw, :mswin]
gem "rbpdf", "~> 1.19.6"

# Optional gem for LDAP authentication
group :ldap do
  gem "net-ldap", "~> 0.16.0"
end

# Optional gem for OpenID authentication
group :openid do
  gem "ruby-openid", "~> 2.9.2", :require => "openid"
  gem "rack-openid"
end

platforms :mri, :mingw, :x64_mingw do
  # Optional gem for exporting the gantt to a PNG file, not supported with jruby
  group :rmagick do
    gem "rmagick", ">= 2.16.0"
  end

  # Optional Markdown support, not for JRuby
  group :markdown do
    gem 'redcarpet', '~> 3.5.1'
  end
end

# Include database gems for the adapters found in the database
# configuration file
require 'erb'
require 'yaml'
gem "pg", "~> 1.1.4", :platforms => [:mri, :mingw, :x64_mingw]

group :development do
  gem "yard"
end

group :test do
  gem "rails-dom-testing"
  gem 'mocha', '>= 1.4.0'
  gem "simplecov", "~> 0.14.1", :require => false
  # For running system tests
  gem 'puma', '~> 3.7'
  gem "capybara", '~> 2.13'
  gem "selenium-webdriver"
end

local_gemfile = File.join(File.dirname(__FILE__), "Gemfile.local")
if File.exists?(local_gemfile)
  eval_gemfile local_gemfile
end

# Load plugins' Gemfiles
Dir.glob File.expand_path("../plugins/*/{Gemfile,PluginGemfile}", __FILE__) do |file|
  eval_gemfile file
end
