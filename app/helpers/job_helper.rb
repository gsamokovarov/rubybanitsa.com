module JobHelper
  JOB_LOGO_SIZES = {
    small: '40x40',
    medium: '60x60',
    big: '160x160',
  }

  def job_logo_tag(job, size: :medium)
    return unless job.logo.attached?

    image_tag job.logo.variant(resize: JOB_LOGO_SIZES.fetch(size)), class: :logo
  end

  def job_render(job)
    JobRenderer.render_html(job).html_safe
  end
end
