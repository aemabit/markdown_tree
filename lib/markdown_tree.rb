require "markdown_tree/version"
require "markdown_tree/configuration"
require "markdown_tree/railtie" if defined?(Rails)

module MarkdownTree
  class << self
    def generate_tree(directory = nil)
      directory ||= configuration.root_directory || Dir.pwd

      File.open(configuration.output_file, "w") do |file|
        process_directory(directory, file)
      end
    end

    private

    def process_directory(directory, file, prefix = "")
      items = Dir.entries(directory) - [".", ".."]

      items.reject! { |item| configuration.exclude_list.include?(item) }

      items.each_with_index do |item, index|
        path = File.join(directory, item)
        is_last = index == items.size - 1
        connector = is_last ? "└── " : "├── "

        file.puts "#{prefix}#{connector}#{item}"

        if File.directory?(path)
          new_prefix = prefix + (is_last ? "    " : "│   ")
          process_directory(path, file, new_prefix)
        end
      end
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

  configure do |config|
    config.exclude_list = ["node_modules", ".git", ".DS_Store"]
    config.root_directory = Dir.pwd
    config.output_file = "directory_structure.md"
  end
end
