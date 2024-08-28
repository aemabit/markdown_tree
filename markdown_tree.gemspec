# frozen_string_literal: true

require_relative "lib/markdown_tree/version"

Gem::Specification.new do |spec|
  spec.name = "markdown_tree"
  spec.version = MarkdownTree::VERSION
  spec.authors = ["aemabit"]
  spec.email = ["am@connectnodes.io"]

  spec.summary = "Generates a directory structure in Markdown format."
  spec.description = "MarkdownTree is designed for developers and teams who need a simple and flexible way to document the structure of their projects. Whether you are preparing a README, documenting a codebase, or generating a project overview, MarkdownTree allows you to create a clear and organized representation of your directory structure in Markdown format.

  With MarkdownTree, you can:
  - Exclude specific folders or files from the generated structure.
  - Define the root directory from which to start generating the structure.
  - Customize the output file name to fit your documentation standards.

  MarkdownTree integrates seamlessly with Rails and other Ruby applications, offering an initializer for easy configuration. It is a valuable tool for maintaining clear and up-to-date project documentation."
  spec.homepage = "https://github.com/aemabit/markdown_tree"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/aemabit/markdown_tree/blob/main/CHANGELOG.md"

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
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
