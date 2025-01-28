# frozen_string_literal: true

require_relative "lib/apis/version"

Gem::Specification.new do |spec|
  spec.name = "apis"
  spec.version = Apis::VERSION
  spec.authors = ["Anh Nguyen"]
  spec.email = ["anh.nt@josys.com"]

  spec.summary = "Add common repo for schema"
  spec.description = "GRPC related code here"
  spec.homepage = "https://github.com/tuananh131001/api"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"


  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "google-protobuf", "~> 4.29.3"
  spec.add_dependency "grpc", "~> 1.69"


  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
