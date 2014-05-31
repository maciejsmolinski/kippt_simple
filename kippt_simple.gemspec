# -*- encoding : utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kippt_simple/version'

Gem::Specification.new do |spec|
  spec.name          = "kippt_simple"
  spec.version       = KipptSimple::VERSION
  spec.authors       = ["Maciej Smoliński"]
  spec.email         = ["contact@maciejsmolinski.com"]
  spec.summary       = %q{Kippt.com simple api explorer}
  spec.description   = %q{Supports lists and clips}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"

  spec.add_dependency "faraday", "~> 0.9"
  spec.add_dependency "json", "~> 1.8"
end
