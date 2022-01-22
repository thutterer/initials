
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "initials/version"

Gem::Specification.new do |spec|
  spec.name          = "initials"
  spec.version       = Initials::VERSION
  spec.authors       = ["Thomas Hutterer"]
  spec.email         = ["tohu@tuta.io"]

  spec.summary       = "Simple SVG avatars"
  spec.description   = "Use colorful SVGs as user avatars in any Ruby and Rails application."
  spec.homepage      = "https://github.com/thutterer/initials"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
