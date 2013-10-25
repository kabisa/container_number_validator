# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'container_number_validator/version'

Gem::Specification.new do |spec|
  spec.name          = 'container_number_validator'
  spec.version       = ContainerNumberValidator::VERSION
  spec.authors       = ['Niels Stevens', 'Michel De Graaf']
  spec.email         = ['niels@kabisa.nl', 'michel@kabisa.nl']
  spec.description   = %q{This gems validates Sea Container Numbers. It adds a Rails validator for this to your project.}
  spec.summary       = %q{Validate Sea Container numbers}
  spec.homepage      = 'https://github.com/kabisaict/container_number_validator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec', '~> 2.14.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'activemodel', '~> 4.0.0'
end