# frozen_string_literal: true

module AdministrationHelper
  def admin_actions
    content_for(:admin_actions) { yield }
  end
end
