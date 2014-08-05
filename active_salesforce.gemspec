# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_salesforce/version'

Gem::Specification.new do |spec|
  spec.name          = "active_salesforce"
  spec.version       = ActiveSalesforce::VERSION
  spec.authors       = ["Thiago Dutra Chiarato"]
  spec.email         = ["thiago.chiarato@hotmail.com"]
  spec.summary       = "Simple salesforce connector"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'databasedotcom'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
end
