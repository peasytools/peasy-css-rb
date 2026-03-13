# frozen_string_literal: true

require_relative "lib/peasy_css/version"

Gem::Specification.new do |s|
  s.name        = "peasy-css"
  s.version     = PeasyCSS::VERSION
  s.summary     = "CSS generators — gradients, shadows, flexbox, grid"
  s.description = "CSS code generator for Ruby — create linear/radial gradients, box/text shadows, border-radius, flexbox layouts, and CSS grid. Zero dependencies, outputs copy-paste CSS."
  s.authors     = ["PeasyTools"]
  s.email       = ["hello@peasytools.com"]
  s.homepage    = "https://peasycss.com"
  s.license     = "MIT"
  s.required_ruby_version = ">= 3.0"

  s.files = Dir["lib/**/*.rb"]

  s.metadata = {
    "homepage_uri"      => "https://peasycss.com",
    "source_code_uri"   => "https://github.com/peasytools/peasy-css-rb",
    "changelog_uri"     => "https://github.com/peasytools/peasy-css-rb/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://peasycss.com",
    "bug_tracker_uri"   => "https://github.com/peasytools/peasy-css-rb/issues",
  }
end
