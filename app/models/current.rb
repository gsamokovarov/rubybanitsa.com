class Current < ActiveSupport::CurrentAttributes
  attribute :vibe

  def vibe? = !!vibe
end
