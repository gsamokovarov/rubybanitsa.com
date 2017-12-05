module MarkdownHelper
  def render_markdown(content)
    MD.render_html(content).html_safe
  end
end
