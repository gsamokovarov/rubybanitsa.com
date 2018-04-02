module MarkdownHelper
  def render_markdown(content, plain: false)
    if plain
      MD.render_plain(content).html_safe
    else
      MD.render_html(content).html_safe
    end
  end
end
