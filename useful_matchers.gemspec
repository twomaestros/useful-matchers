# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'useful_matchers/version'

Gem::Specification.new do |spec|
  spec.name          = "useful_matchers"
  spec.version       = UsefulMatchers::VERSION
  spec.authors       = ["Two Maestros"]
  spec.email         = ["team@twomaestros.com"]
  spec.summary       = %q{A set of useful matchers for RSpec}
  spec.description   = %q{A set of useful matchers for RSpec}
  spec.homepage      = "http://github.com/twomaestros/useful-matchers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "rspec"
end
