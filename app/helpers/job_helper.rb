# frozen_string_literal: true

module JobHelper
  JOB_LOGO_SIZES = {
    small: "50x50",
    medium: "60x60",
    big: "160x160",
  }.freeze

  def job_logo_tag(job, size: :medium)
    return unless job.logo.attached?

    image_tag job.logo.variant(resize: JOB_LOGO_SIZES.fetch(size)), class: :logo
  end

  def job_render(job, plain: false)
    if plain
      strip_tags JobRenderer.render_plain(job).html_safe
    else
      JobRenderer.render_html(job).html_safe
    end
  end
end
