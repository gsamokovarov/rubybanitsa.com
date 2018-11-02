# frozen_string_literal: true

class JobRenderer
  class << self
    def render_html(job)
      new(job).render_html
    end

    def render_plain(job)
      new(job).render_plain
    end
  end

  def initialize(job)
    @job = job
  end

  def render_html
    MD.render_html(description_with_photos)
  end

  def render_plain
    MD.render_plain(description_without_photos)
  end

  private

  PHOTO_PLACEHOLDER = /\[(\d+)\]/

  def description_with_photos
    @job.description.gsub(PHOTO_PLACEHOLDER) do |m|
      "![photo #{m[1]}](#{photo_url(m[1])})"
    end
  end

  def description_without_photos
    @job.description.remove(PHOTO_PLACEHOLDER)
  end

  def photo_url(index)
    Link.url_for(@job.photos[index.to_i - 1])
  end
end
