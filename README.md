# MarkdownTree

**MarkdownTree** is a Ruby gem that generates a directory structure in Markdown format. It is highly configurable, allowing you to exclude specific folders, choose the root directory, and specify the output file name.

## Installation

You can install the gem and add it to your application's Gemfile by executing:

```bash
bundle add markdown_tree
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install markdown_tree
```

## Usage

### Basic Example

To generate the directory structure in Markdown format from the current directory, simply call the `generate_tree` method:

```ruby
require 'markdown_tree'

MarkdownTree.generate_tree
```

### Excluding Specific Folders

You can configure which folders to exclude from the generated structure:

```ruby
MarkdownTree.configure do |config|
  config.exclude_list = ['node_modules', '.git', 'tmp']
end

MarkdownTree.generate_tree
```

### Selecting the Root Directory

You can also specify the directory from which you want to generate the structure:

```ruby
MarkdownTree.configure do |config|
  config.root_directory = '/path/to/your/directory'
end

MarkdownTree.generate_tree
```

### Customizing the Output File Name

You can set the name of the file where the directory structure will be saved:

```ruby
MarkdownTree.configure do |config|
  config.output_file = 'custom_directory_structure.md'
end

MarkdownTree.generate_tree
```

### Full Configuration Example in Rails

If you're using Rails, you can configure all these options in an initializer:

```ruby
# config/initializers/markdown_tree.rb
MarkdownTree.configure do |config|
  config.exclude_list = ['node_modules', '.git', 'tmp']  # Directories to exclude
  config.root_directory = Rails.root.join('app').to_s     # Root directory to start generating structure
  config.output_file = 'custom_directory_structure.md'    # Output file name
end
```

## Contributing
Contribution directions go here. You can fork the repository, create a new branch, and submit a pull request for review. Please make sure to write tests for your contributions and follow the coding standards set in the project.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
