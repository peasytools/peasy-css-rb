# peasy-css

[![Gem Version](https://badge.fury.io/rb/peasy-css.svg)](https://rubygems.org/gems/peasy-css)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Ruby client for the [PeasyCSS](https://peasycss.com) API — minify, format, and analyze CSS code. Zero dependencies beyond Ruby stdlib (Net::HTTP, JSON, URI).

Built from [PeasyCSS](https://peasycss.com), a free online CSS toolkit with tools for every CSS workflow — minify stylesheets, format and beautify code, generate gradients, shadows, flexbox layouts, and grid systems.

> **Try the interactive tools at [peasycss.com](https://peasycss.com)** — [CSS Tools](https://peasycss.com/), [CSS Glossary](https://peasycss.com/glossary/), [CSS Guides](https://peasycss.com/guides/)

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

## API Client

The client wraps the [PeasyCSS REST API](https://peasycss.com/developers/) using only Ruby standard library — no external dependencies.

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

## Learn More

- **Tools**: [CSS Minify](https://peasycss.com/css/css-minify/) · [CSS Beautify](https://peasycss.com/css/css-beautify/) · [CSS Gradient Generator](https://peasycss.com/css/css-gradient/) · [All Tools](https://peasycss.com/)
- **Guides**: [CSS Units Explained](https://peasycss.com/guides/css-units-explained/) · [CSS Grid vs Flexbox](https://peasycss.com/guides/css-grid-vs-flexbox-when-to-use-each/) · [All Guides](https://peasycss.com/guides/)
- **Glossary**: [BEM](https://peasycss.com/glossary/bem/) · [Box Model](https://peasycss.com/glossary/box-model/) · [Cascade](https://peasycss.com/glossary/cascade/) · [All Terms](https://peasycss.com/glossary/)
- **Formats**: [CSS](https://peasycss.com/formats/css/) · [SVG](https://peasycss.com/formats/svg/) · [All Formats](https://peasycss.com/formats/)
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
| peasy-pdf | [PyPI](https://pypi.org/project/peasy-pdf/) | [npm](https://www.npmjs.com/package/peasy-pdf) | [Gem](https://rubygems.org/gems/peasy-pdf) | PDF merge, split, rotate, compress — [peasypdf.com](https://peasypdf.com) |
| peasy-image | [PyPI](https://pypi.org/project/peasy-image/) | [npm](https://www.npmjs.com/package/peasy-image) | [Gem](https://rubygems.org/gems/peasy-image) | Image resize, crop, convert, compress — [peasyimage.com](https://peasyimage.com) |
| peasy-audio | [PyPI](https://pypi.org/project/peasy-audio/) | [npm](https://www.npmjs.com/package/peasy-audio) | [Gem](https://rubygems.org/gems/peasy-audio) | Audio trim, merge, convert, normalize — [peasyaudio.com](https://peasyaudio.com) |
| peasy-video | [PyPI](https://pypi.org/project/peasy-video/) | [npm](https://www.npmjs.com/package/peasy-video) | [Gem](https://rubygems.org/gems/peasy-video) | Video trim, resize, thumbnails, GIF — [peasyvideo.com](https://peasyvideo.com) |
| **peasy-css** | [PyPI](https://pypi.org/project/peasy-css/) | [npm](https://www.npmjs.com/package/peasy-css) | [Gem](https://rubygems.org/gems/peasy-css) | **CSS minify, format, analyze — [peasycss.com](https://peasycss.com)** |
| peasy-compress | [PyPI](https://pypi.org/project/peasy-compress/) | [npm](https://www.npmjs.com/package/peasy-compress) | [Gem](https://rubygems.org/gems/peasy-compress) | ZIP, TAR, gzip compression — [peasytools.com](https://peasytools.com) |
| peasy-document | [PyPI](https://pypi.org/project/peasy-document/) | [npm](https://www.npmjs.com/package/peasy-document) | [Gem](https://rubygems.org/gems/peasy-document) | Markdown, HTML, CSV, JSON conversion — [peasyformats.com](https://peasyformats.com) |
| peasytext | [PyPI](https://pypi.org/project/peasytext/) | [npm](https://www.npmjs.com/package/peasytext) | [Gem](https://rubygems.org/gems/peasytext) | Text case conversion, slugify, word count — [peasytext.com](https://peasytext.com) |

## License

MIT
