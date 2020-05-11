
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "silent_ping/version"

Gem::Specification.new do |spec|
  spec.name          = "silent_ping"
  spec.version       = SilentPing::VERSION
  spec.authors       = ["Zhuo-Fei Hui"]
  spec.email         = ["fei@blinkist.com"]

  spec.summary       = %q{ Provides an /ping endpoint for Rack health check, that doesn't get logged. }
  spec.description   = %q{ Provides an /ping endpoint for Rack health check, that doesn't get logged. }
  spec.homepage      = "https://github.com/blinkist/silent_ping"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://example.com"
    spec.metadata["changelog_uri"] = "https://example.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

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
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
