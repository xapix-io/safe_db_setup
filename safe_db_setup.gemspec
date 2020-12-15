
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "safe_db_setup/version"

Gem::Specification.new do |spec|
  spec.name          = "safe_db_setup"
  spec.version       = SafeDbSetup::VERSION
  spec.authors       = ["Michael Reinsch"]
  spec.email         = ["michael@xapix.com"]

  spec.summary       = %q{Safely setup the DB for Rails applications}
  spec.description   = %q{Safely setup the DB for Rails applications by either loading the current schema if the database doesn't exist or running migrations on existing databases.}
  spec.homepage      = "https://github.com/xapix-io/safe_db_setup"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_dependency "rails", ">= 5.2", "< 6.2"
end
