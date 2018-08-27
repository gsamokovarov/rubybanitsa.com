# frozen_string_literal: true

module Administration
  extend ActiveSupport::Concern

  included do
    helper_method :admin?, :admin_path_for_current_page
  end

  def admin!
    cookies.signed[:admin] = true
  end

  def admin?
    cookies.signed[:admin]
  end

  def admin_path_for_current_page
    "/admin" + request.path
  end
end
