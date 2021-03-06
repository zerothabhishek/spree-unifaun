# coding: utf-8
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'spree_unifaun/version'

Gem::Specification.new do |s|
  s.platform     = Gem::Platform::RUBY
  s.name         = 'spree_unifaun'
  s.version      = SpreeUnifaun::VERSION
  s.summary      = 'Unifaun Packsoft ERPConnect for Spree Commerce'
  s.description  = s.summary
  s.required_ruby_version = '>= 1.9.3'

  s.authors      = ['Tobias Bohwalli', 'Abhishek Yadav']
  s.email        = 'hi@futhr.io'
  s.homepage     = 'https://github.com/futhr/spree-unifaun'
  s.license      = %q{BSD-3}

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_runtime_dependency 'spree', '~> 2.0'

  s.add_development_dependency 'vcr', '~> 2.5.0'
  s.add_development_dependency 'webmock', '= 1.10'
  s.add_development_dependency 'rspec-rails', '~> 2.13'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'sqlite3', '~> 1.3.7'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'fuubar', '>= 0.0.1'
  s.add_development_dependency 'i18n-spec', '~> 0.4.0'
  s.add_development_dependency 'capybara', '~> 2.1.0'
  s.add_development_dependency 'pry-rails'
end
