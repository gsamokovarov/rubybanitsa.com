require "md"

Maildown::MarkdownEngine.set_html do |content|
  MD.render_html(content).html_safe
end

Maildown::MarkdownEngine.set_text do |content|
  MD.render_plain(content).html_safe
end
