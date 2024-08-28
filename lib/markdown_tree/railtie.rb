module MarkdownTree
  class Railtie < Rails::Railtie
    initializer "markdown_tree.configure" do |app|
      MarkdownTree.configure do |config|
        config.exclude_list = ["node_modules", ".git"]
        config.root_directory = Rails.root.to_s
        config.output_file = "directory_structure.md"
      end
    end
  end
end
