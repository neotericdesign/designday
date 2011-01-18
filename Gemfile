source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'bundler', '~>1.0.7'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end

# REFINERY CMS ================================================================

java = (RUBY_PLATFORM == 'java')

# Specify the Refinery CMS core:
gem 'refinerycms',              :git => 'git://github.com/neotericdesign/refinerycms.git', :branch => 'master'

gem 'friendly_id',              :git => 'git://github.com/parndt/friendly_id', :branch => 'globalize3'

group :development, :test do  
  # RSpec
  gem 'rspec-rails',            '= 2.3'
  # Cucumber
  gem 'capybara',               '>= 0.4.1.rc'
  gem 'database_cleaner'
  gem 'cucumber-rails'
  gem 'launchy'
  gem 'gherkin'
  gem 'spork' unless Bundler::WINDOWS
  gem 'rack-test',              '~> 0.5.6'
  # FIXME: Update json_pure to 1.4.7 when it is released
  gem 'json_pure', "1.4.6a", :git => "git://github.com/flori/json", :ref => "0b15820e245f4048d1bcd29cd60693e4e211ab43"
  # Factory Girl
  gem 'factory_girl'
  gem "#{'j' if java}ruby-prof" unless defined?(RUBY_ENGINE) and RUBY_ENGINE == 'rbx'
  # Autotest
  gem 'autotest'
  gem 'autotest-rails'
  gem 'autotest-notification'
  # FIXME: Replace when new babosa gem is released
  gem 'babosa', '0.2.0',        :git => 'git://github.com/stevenheidel/babosa' if java
end

# END REFINERY CMS ============================================================

# USER DEFINED


# Specify additional Refinery CMS Engines here (all optional):
gem 'refinerycms-generators',   '~> 0.9.9', :git => 'git://github.com/resolve/refinerycms-generators'
# gem 'refinerycms-inquiries',    '~> 0.9.9.9'
# gem 'refinerycms-news',         '~> 1.0'
# gem 'refinerycms-portfolio',    '~> 0.9.9'
# gem 'refinerycms-theming',      '~> 0.9.9'
# gem 'refinerycms-search',       '~> 0.9.8'
# gem 'refinerycms-blog',         '~> 1.1'

# Add i18n support (optional, you can remove this if you really want to).
gem 'routing-filter',           :git => 'git://github.com/refinerycms/routing-filter'
gem 'refinerycms-i18n',         '~> 0.9'

gem 'jruby-openssl' if java
gem 'ya2yaml'

# END USER DEFINED
