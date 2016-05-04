# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'use_urandom/version'

Gem::Specification.new do |spec|
  spec.name          = "use_urandom"
  spec.version       = UseUrandom::VERSION
  spec.authors       = ["Technion"]
  spec.email         = ["technion@lolware.net"]

  spec.summary       = %q{Monkey Patches SecureRandom to use /dev/urandom}
  spec.description   = %q{Prefer urandom to OpenSSL}
  spec.homepage      = "https://github.com/technion/use_urandom"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-stub-const" , "~> 0.5"
end
