# frozen_string_literal: true

module Administration
  extend ActiveSupport::Concern

  class Current < ActiveSupport::CurrentAttributes
    attribute :admin_path

    resets do
      self.admin_path = nil
    end
  end

  included do
    before_action do
      Current.admin_path = "/admin#{request.path}"
    end

    helper_method :admin?, :admin_path_for_current_page
  end

  def admin!
    cookies.signed[:admin] = { value: true, expires: 3.months }
  end

  def admin?
    cookies.signed[:admin]
  end

  def admin_path_for_current_page(value = nil)
    if value
      Current.admin_path = value
    else
      Current.admin_path
    end
  end
end
