# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chefdist/version'

Gem::Specification.new do |spec|
  spec.name          = "chefdist"
  spec.version       = Chefdist::VERSION
  spec.authors       = ["brettcave"]
  spec.email         = ["brett@cave.za.net"]
  spec.summary       = %q{Chefdist creates a distributable package from a chef repo}
  spec.description   = %q{Chefdist generates a distributable package from a chef repo that can be used for serverless chef runs, e.g. with solo or zero.}
  spec.homepage      = "http://github.com/brettcave/chefdist"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "minitar"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
end
