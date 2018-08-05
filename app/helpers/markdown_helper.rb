# frozen_string_literal: true

module MarkdownHelper
  def render_markdown(content, plain: false)
    if plain
      strip_tags MD.render_plain(content).html_safe
    else
      MD.render_html(content).html_safe
    end
  end
end
