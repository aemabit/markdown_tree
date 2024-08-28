require "spec_helper"
require "markdown_tree"

RSpec.describe MarkdownTree do
  it "generates a directory structure in Markdown format with default values" do
    MarkdownTree.generate_tree

    expect(File).to exist("directory_structure.md")

    content = File.read("directory_structure.md")
    expect(content).to include("markdown_tree_spec.rb")
  end

  it "generates a directory structure in Markdown format" do
    MarkdownTree.configure do |config|
      config.exclude_list = []
      config.root_directory = Dir.pwd
      config.output_file = "test_structure.md"
    end

    MarkdownTree.generate_tree

    expect(File).to exist("test_structure.md")

    content = File.read("test_structure.md")
    expect(content).to include("markdown_tree_spec.rb")

    File.delete("test_structure.md") if File.exist?("test_structure.md")
  end

  it "excludes specified directories" do
    MarkdownTree.configure do |config|
      config.exclude_list = ["spec"]
      config.output_file = "test_structure_excluded.md"
    end

    MarkdownTree.generate_tree

    expect(File).to exist("test_structure_excluded.md")

    content = File.read("test_structure_excluded.md")
    expect(content).not_to include("spec/")

    File.delete("test_structure_excluded.md") if File.exist?("test_structure_excluded.md")
  end

  it "generates a directory structure in Markdown format for a specified directory" do
    MarkdownTree.configure do |config|
      config.exclude_list = []
      config.output_file = "test_structure_specified.md"
      config.root_directory = File.join(Dir.pwd, "spec")
    end

    MarkdownTree.generate_tree

    expect(File).to exist("test_structure_specified.md")

    content = File.read("test_structure_specified.md")
    expect(content).to include("markdown_tree_spec.rb")

    File.delete("test_structure_specified.md") if File.exist?("test_structure_specified.md")
  end
end
