# frozen_string_literal: true

module JobHelper
  def job_thumb_tag(job, size: :pristine, **options)
    if thumb = JobMedia.new(job).thumb(size: size)
      options[:class] ||= :thumb

      image_tag thumb, options
    end
  end

  def job_render(job, plain: false)
    if plain
      strip_tags JobRenderer.render_plain(job).html_safe
    else
      JobRenderer.render_html(job).html_safe
    end
  end
end
