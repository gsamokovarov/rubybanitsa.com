# frozen_string_literal: true

class JobMedia
  def initialize(job)
    @job = job
  end

  THUMB_SIZES = {
    small: "40x40",
    medium: "60x60",
    big: "160x160",
    pristine: nil
  }.freeze

  def thumb(size: :small)
    return unless thumbnail_or_logo.attached?
    return thumbnail_or_logo if size == :pristine

    thumbnail_or_logo.variant(resize: THUMB_SIZES.fetch(size))
  end

  def logo
    @job.logo
  end

  private

  def thumbnail_or_logo
    if @job.thumbnail.attached?
      @job.thumbnail
    else
      logo
    end
  end
end
