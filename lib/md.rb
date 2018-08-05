# frozen_string_literal: true

require "redcarpet/render_strip"

# MD is a facade over the Redcarpet markdown rendering library with preset HTML
# and Plain text renderers.
module MD
  cattr_accessor :html do
    Redcarpet::Markdown.new Redcarpet::Render::HTML,
      autolink: true,
      tables: true,
      strikethrough: true
  end

  cattr_accessor :plain do
    Redcarpet::Markdown.new Redcarpet::Render::StripDown
  end

  module_function

  def render_html(content)
    html.render(content)
  end

  def render_plain(content)
    plain.render(content)
  end
end
