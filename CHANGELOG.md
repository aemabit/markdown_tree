# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

## [0.1.3] - 2024-08-27

### Fixed
- Resolved final configuration issue in Rails initializer that was preventing correct loading of settings.

## [0.1.2] - 2024-08-27

### Fixed
- Addressed issues with gem configuration where custom settings were not being properly applied.

## [0.1.1] - 2024-08-27

### Fixed
- Fixed initial issues with configuration setup, ensuring that the gem's settings could be customized correctly.

## [0.1.0] - 2024-08-27

### Added
- Initial release of `MarkdownTree`.
- Added support for generating directory structures in Markdown format.
- Configurable options for excluding directories, setting the root directory, and specifying the output file name.
- Integration with Rails via a Railtie, allowing configuration through a Rails initializer.
