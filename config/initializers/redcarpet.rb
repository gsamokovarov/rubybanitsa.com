Rails.configuration.to_prepare do
  MarkdownHelper.markdown =
    Redcarpet::Markdown.new Redcarpet::Render::HTML,
      autolink: true,
      tables: true,
      strikethrough: true
end
