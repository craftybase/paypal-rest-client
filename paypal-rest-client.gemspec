# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paypal/rest/client/version'

Gem::Specification.new do |gem|
  gem.name          = 'paypal-rest-client'
  gem.version       = Paypal::Rest::Client::VERSION
  gem.authors       = ['Nathan Hawes']
  gem.email         = ['nath@craftybase.com']
  gem.summary       = %q{API client for PayPal REST.}
  gem.description   = %q{API client for PayPal REST}
  gem.homepage      = ''

  gem.files         = Dir['lib/**/*.rb']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bundler', '~> 1.10'
  gem.add_development_dependency 'rake', '~> 10.0'

  gem.add_development_dependency 'rspec',     '~> 3.2'
  gem.add_development_dependency 'simplecov', '~> 0.10'
  gem.add_development_dependency 'webmock',   '~> 1.21'
  gem.add_development_dependency 'vcr',       '~> 2.9'
  gem.add_development_dependency 'pry',       '~> 0.10'
  gem.add_development_dependency 'pry-nav',   '~> 0.2'

  gem.add_dependency 'faraday', '~> 1.0'
  gem.add_dependency 'faraday_middleware', '~> 1.1'
  gem.add_dependency 'json', '~> 2.6'
  gem.add_dependency 'hashie', '~> 3.6'
end
