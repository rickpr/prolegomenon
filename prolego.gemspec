# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prolego/version'

Gem::Specification.new do |spec|
  spec.name          = "prolego"
  spec.version       = Prolego::VERSION
  spec.authors       = ["Ricardo Piro-Rael"]
  spec.email         = ["fdisk@fdisk.co"]
  spec.summary       = %q{This gem interfaces Ruby with Prolog via the shell.}
  spec.description   = %q{Designed initially for UNM Informatics lab}
  spec.homepage      = "https://github.com/rickpr/prolegomenon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
