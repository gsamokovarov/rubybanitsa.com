# frozen_string_literal: true

module AdministrationHelper
  def admin_actions(&block)
    content_for(:admin_actions, &block)
  end
end
