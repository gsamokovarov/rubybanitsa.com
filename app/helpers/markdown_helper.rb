module MarkdownHelper
  mattr_accessor :markdown

  def render_markdown(content)
    markdown.render(content).html_safe
  end
end
