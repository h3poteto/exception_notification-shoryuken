# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'exception_notification/shoryuken/version'

Gem::Specification.new do |spec|
  spec.name          = "exception_notification-shoryuken"
  spec.version       = ExceptionNotification::Shoryuken::VERSION
  spec.authors       = ["h3poteto"]
  spec.email         = ["h3.poteto@gmail.com"]

  spec.summary       = %q{exception_notification's plugin for shoryuken.}
  spec.description   = %q{exception_notification's plugin for shoryuken.}
  spec.homepage      = "https://github.com/h3poteto/exception_notification-shoryuken"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'exception_notification', "~> 4"
  spec.add_runtime_dependency 'shoryuken', ">= 4.0", "<= 5.4"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'aws-sdk-sqs', "~> 1.13"
end
