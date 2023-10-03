# frozen_string_literal: true

module JobHelper
  def job_thumb_tag(job, size: :pristine, **options)
    if (thumb = JobMedia.new(job).thumb(size:))
      options[:class] ||= :thumb

      image_tag thumb, options
    end
  end

  def job_application_tag(job)
    return if job.application_url.blank?
    return if job.expired?

    primary_button job.application_url do
      "Apply for the job"
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
