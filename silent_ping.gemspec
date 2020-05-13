
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "silent_ping/version"

Gem::Specification.new do |spec|
  spec.name          = "silent_ping"
  spec.version       = SilentPing::VERSION
  spec.authors       = ["Blinkist", "Zhuo-Fei Hui"]
  spec.email         = ["operations@blinkist.com", "fei@blinkist.com"]

  spec.summary       = %q{ Provides an /ping endpoint for Rack health check, that doesn't get logged. }
  spec.description   = %q{ Provides an /ping endpoint for Rack health check, that doesn't get logged. }
  spec.homepage      = "https://github.com/blinkist/silent_ping"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.16.1"
  spec.add_development_dependency "railties", "~> 5.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
