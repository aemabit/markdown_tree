module MarkdownTree
  class Configuration
    attr_accessor :exclude_list, :root_directory, :output_file

    def initialize
      @exclude_list = ["node_modules", ".git", ".DS_Store"]
      @root_directory = Dir.pwd
      @output_file = "directory_structure.md"
    end
  end

  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end

    def exclude_list
      configuration.exclude_list
    end

    def root_directory
      configuration.root_directory
    end

    def output_file
      configuration.output_file
    end
  end
end
