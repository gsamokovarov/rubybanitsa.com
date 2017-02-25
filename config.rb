configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end

activate :gh_pages do |gh_pages|
  gh_pages.remote = 'https://github.com/gsamokovarov/rubybanitsa.com'
end
