# peasy-css

[![Gem Version](https://badge.fury.io/rb/peasy-css.svg)](https://rubygems.org/gems/peasy-css)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Ruby client for the [PeasyCSS](https://peasycss.com) API -- minify, beautify, and convert CSS units with tools for gradient generation, shadow creation, flexbox layouts, and grid systems. Zero dependencies beyond Ruby stdlib (Net::HTTP, JSON, URI).

Built from [PeasyCSS](https://peasycss.com), a comprehensive CSS toolkit offering free online tools for minifying, formatting, analyzing, and generating CSS code with detailed property guides, layout references, and a glossary covering modern CSS specifications including Grid, Flexbox, Custom Properties, and Container Queries.

> **Try the interactive tools at [peasycss.com](https://peasycss.com)** -- [CSS Minify](https://peasycss.com/css/css-minify/), [CSS Beautify](https://peasycss.com/css/css-beautify/), [CSS Unit Converter](https://peasycss.com/css/css-unit-converter/), and more.

<p align="center">
  <img src="demo.gif" alt="peasy-css demo -- CSS minify, beautify, and unit conversion tools in Ruby terminal" width="800">
</p>

## Table of Contents

- [Install](#install)
- [Quick Start](#quick-start)
- [What You Can Do](#what-you-can-do)
  - [CSS Optimization Tools](#css-optimization-tools)
  - [Browse CSS Reference Content](#browse-css-reference-content)
  - [Search and Discovery](#search-and-discovery)
- [API Client](#api-client)
  - [Available Methods](#available-methods)
- [Learn More About CSS Tools](#learn-more-about-css-tools)
- [Also Available](#also-available)
- [Peasy Developer Tools](#peasy-developer-tools)
- [License](#license)

## Install

```bash
gem install peasy-css
```

Or add to your Gemfile:

```ruby
gem "peasy-css"
```

## Quick Start

```ruby
require "peasy_css"

client = PeasyCSS::Client.new

# List available CSS tools
tools = client.list_tools
tools["results"].each do |tool|
  puts "#{tool["name"]}: #{tool["description"]}"
end
```

## What You Can Do

### CSS Optimization Tools

CSS optimization is essential for web performance. Minified CSS reduces file sizes by removing whitespace, comments, and redundant declarations, while beautified CSS restores readability for debugging. The PeasyCSS API provides programmatic access to these transformations alongside unit conversion tools for responsive design workflows.

| Tool | Description | Use Case |
|------|-------------|----------|
| CSS Minify | Remove whitespace and comments from CSS | Production builds, CI/CD pipelines |
| CSS Beautify | Format and indent CSS for readability | Code review, debugging |
| CSS Unit Converter | Convert between px, rem, em, vw, vh | Responsive design systems |

```ruby
require "peasy_css"

client = PeasyCSS::Client.new

# Fetch the CSS Minify tool details
tool = client.get_tool("css-minify")
puts "Tool: #{tool["name"]}"           # CSS minification tool
puts "Category: #{tool["category"]}"   # CSS optimization category

# List all CSS file formats and their MIME types
formats = client.list_formats
formats["results"].each do |fmt|
  puts "#{fmt["name"]} (#{fmt["extension"]}): #{fmt["mime_type"]}"
end
```

Learn more: [CSS Minify Tool](https://peasycss.com/css/css-minify/) · [CSS Beautify Tool](https://peasycss.com/css/css-beautify/) · [How to Minify CSS for Production](https://peasycss.com/guides/how-to-minify-css-production/)

### Browse CSS Reference Content

Modern CSS has evolved far beyond simple selectors and properties. Concepts like CSS Grid, Flexbox, Custom Properties (CSS variables), specificity rules, and the cascade determine how styles are applied. The PeasyCSS glossary provides clear definitions and practical examples for these foundational concepts, while guides offer in-depth tutorials on layout techniques and optimization strategies.

| Glossary Term | Description |
|---------------|-------------|
| Flexbox | One-dimensional layout model for distributing space along a row or column |
| Grid | Two-dimensional layout system for rows and columns simultaneously |
| Specificity | Algorithm that determines which CSS rule takes precedence |
| Custom Property | CSS variables defined with `--` prefix, enabling dynamic theming |
| Minification | Process of removing unnecessary characters from CSS without changing functionality |

```ruby
# Browse CSS glossary terms programmatically
glossary = client.list_glossary(search: "flexbox")
glossary["results"].each do |term|
  puts "#{term["term"]}: #{term["definition"]}" # Flexbox layout definition
end

# Read in-depth CSS guides on layout and optimization
guides = client.list_guides(category: "layout")
guides["results"].each do |guide|
  puts "#{guide["title"]} (#{guide["audience_level"]})" # Guide title and difficulty
end
```

Learn more: [Flexbox Glossary](https://peasycss.com/glossary/flexbox/) · [Grid Glossary](https://peasycss.com/glossary/grid/) · [CSS Grid vs Flexbox Guide](https://peasycss.com/guides/css-grid-vs-flexbox-when-to-use-each/)

### Search and Discovery

The unified search endpoint queries across all CSS tools, glossary terms, guides, and file formats simultaneously. This is useful for building editor plugins, documentation search, or scripts that need to surface relevant CSS content based on user queries.

```ruby
# Search across all CSS tools, glossary, and guides
results = client.search("gradient generator")
puts "Found #{results["results"]["tools"].length} tools"
puts "Found #{results["results"]["glossary"].length} glossary terms"
```

Learn more: [Specificity Glossary](https://peasycss.com/glossary/specificity/) · [Custom Property Glossary](https://peasycss.com/glossary/custom-property/) · [All CSS Guides](https://peasycss.com/guides/)

## API Client

The client wraps the [PeasyCSS REST API](https://peasycss.com/developers/) using only Ruby standard library -- no external dependencies.

```ruby
require "peasy_css"

client = PeasyCSS::Client.new
# Or with a custom base URL:
# client = PeasyCSS::Client.new(base_url: "https://custom.example.com")

# List tools with pagination and filters
tools = client.list_tools(page: 1, limit: 10, search: "minify")

# Get a specific tool by slug
tool = client.get_tool("css-minify")
puts "#{tool["name"]}: #{tool["description"]}"

# Search across all content
results = client.search("minify")
puts "Found #{results["results"]["tools"].length} tools"

# Browse the glossary
glossary = client.list_glossary(search: "flexbox")
glossary["results"].each do |term|
  puts "#{term["term"]}: #{term["definition"]}"
end

# Discover guides
guides = client.list_guides(category: "css")
guides["results"].each do |guide|
  puts "#{guide["title"]} (#{guide["audience_level"]})"
end

# List file format conversions
conversions = client.list_conversions(source: "css")

# Get format details
format = client.get_format("css")
puts "#{format["name"]} (#{format["extension"]}): #{format["mime_type"]}"
```

### Available Methods

| Method | Description |
|--------|-------------|
| `list_tools` | List tools (paginated, filterable) |
| `get_tool(slug)` | Get tool by slug |
| `list_categories` | List tool categories |
| `list_formats` | List file formats |
| `get_format(slug)` | Get format by slug |
| `list_conversions` | List format conversions |
| `list_glossary` | List glossary terms |
| `get_glossary_term(slug)` | Get glossary term |
| `list_guides` | List guides |
| `get_guide(slug)` | Get guide by slug |
| `list_use_cases` | List use cases |
| `search(query)` | Search across all content |
| `list_sites` | List Peasy sites |
| `openapi_spec` | Get OpenAPI specification |

All list methods accept keyword arguments: `page:`, `limit:`, `category:`, `search:`.

Full API documentation at [peasycss.com/developers/](https://peasycss.com/developers/).
OpenAPI 3.1.0 spec: [peasycss.com/api/openapi.json](https://peasycss.com/api/openapi.json).

## Learn More About CSS Tools

- **Tools**: [CSS Minify](https://peasycss.com/css/css-minify/) · [CSS Beautify](https://peasycss.com/css/css-beautify/) · [CSS Unit Converter](https://peasycss.com/css/css-unit-converter/) · [All Tools](https://peasycss.com/)
- **Guides**: [CSS Grid vs Flexbox](https://peasycss.com/guides/css-grid-vs-flexbox-when-to-use-each/) · [How to Minify CSS for Production](https://peasycss.com/guides/how-to-minify-css-production/) · [All Guides](https://peasycss.com/guides/)
- **Glossary**: [Flexbox](https://peasycss.com/glossary/flexbox/) · [Grid](https://peasycss.com/glossary/grid/) · [Minification](https://peasycss.com/glossary/minification/) · [Specificity](https://peasycss.com/glossary/specificity/) · [Custom Property](https://peasycss.com/glossary/custom-property/) · [All Terms](https://peasycss.com/glossary/)
- **Formats**: [All Formats](https://peasycss.com/formats/)
- **API**: [REST API Docs](https://peasycss.com/developers/) · [OpenAPI Spec](https://peasycss.com/api/openapi.json)

## Also Available

| Language | Package | Install |
|----------|---------|---------|
| **Python** | [peasy-css](https://pypi.org/project/peasy-css/) | `pip install "peasy-css[all]"` |
| **TypeScript** | [peasy-css](https://www.npmjs.com/package/peasy-css) | `npm install peasy-css` |
| **Go** | [peasy-css-go](https://pkg.go.dev/github.com/peasytools/peasy-css-go) | `go get github.com/peasytools/peasy-css-go` |
| **Rust** | [peasy-css](https://crates.io/crates/peasy-css) | `cargo add peasy-css` |

## Peasy Developer Tools

Part of the [Peasy Tools](https://peasytools.com) open-source developer ecosystem.

| Package | PyPI | npm | RubyGems | Description |
|---------|------|-----|----------|-------------|
| peasy-pdf | [PyPI](https://pypi.org/project/peasy-pdf/) | [npm](https://www.npmjs.com/package/peasy-pdf) | [Gem](https://rubygems.org/gems/peasy-pdf) | PDF merge, split, rotate, compress -- [peasypdf.com](https://peasypdf.com) |
| peasy-image | [PyPI](https://pypi.org/project/peasy-image/) | [npm](https://www.npmjs.com/package/peasy-image) | [Gem](https://rubygems.org/gems/peasy-image) | Image resize, crop, convert, compress -- [peasyimage.com](https://peasyimage.com) |
| peasy-audio | [PyPI](https://pypi.org/project/peasy-audio/) | [npm](https://www.npmjs.com/package/peasy-audio) | [Gem](https://rubygems.org/gems/peasy-audio) | Audio trim, merge, convert, normalize -- [peasyaudio.com](https://peasyaudio.com) |
| peasy-video | [PyPI](https://pypi.org/project/peasy-video/) | [npm](https://www.npmjs.com/package/peasy-video) | [Gem](https://rubygems.org/gems/peasy-video) | Video trim, resize, thumbnails, GIF -- [peasyvideo.com](https://peasyvideo.com) |
| **peasy-css** | [PyPI](https://pypi.org/project/peasy-css/) | [npm](https://www.npmjs.com/package/peasy-css) | [Gem](https://rubygems.org/gems/peasy-css) | **CSS minify, format, analyze -- [peasycss.com](https://peasycss.com)** |
| peasy-compress | [PyPI](https://pypi.org/project/peasy-compress/) | [npm](https://www.npmjs.com/package/peasy-compress) | [Gem](https://rubygems.org/gems/peasy-compress) | ZIP, TAR, gzip compression -- [peasytools.com](https://peasytools.com) |
| peasy-document | [PyPI](https://pypi.org/project/peasy-document/) | [npm](https://www.npmjs.com/package/peasy-document) | [Gem](https://rubygems.org/gems/peasy-document) | Markdown, HTML, CSV, JSON conversion -- [peasyformats.com](https://peasyformats.com) |
| peasytext | [PyPI](https://pypi.org/project/peasytext/) | [npm](https://www.npmjs.com/package/peasytext) | [Gem](https://rubygems.org/gems/peasytext) | Text case conversion, slugify, word count -- [peasytext.com](https://peasytext.com) |

## License

MIT
