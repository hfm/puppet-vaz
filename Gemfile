source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "#{ENV['PUPPET_VERSION']}" : ['>= 4.9']
gem 'puppet', puppetversion

group :test, :development do
  gem 'puppetlabs_spec_helper'
  gem 'puppet-lint'
  gem 'facter'
  gem 'metadata-json-lint'
  gem 'rspec-puppet'
end

group :development do
  gem 'puppet-blacksmith', git: 'https://github.com/voxpupuli/puppet-blacksmith.git'
  gem 'semantic_puppet'
  gem 'puppet-strings'
end

gem 'beaker-rspec', group: :system_tests
