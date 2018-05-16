module TitleHelper
  def title(name)
    content_for(:title) { "#{name} – " } if name.present?

    nil
  end
end
