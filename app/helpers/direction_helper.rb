# frozen_string_literal: true

module DirectionHelper
  def left(name, path)
    content_for :left do
      link_to "← #{name}", path
    end
  end

  def right(name, path)
    content_for :right do
      link_to "#{name} →", path, class: :right
    end
  end
end
