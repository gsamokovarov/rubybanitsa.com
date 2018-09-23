module AdministrationHelper
  def admin_actions
    content_for(:admin_actions) { yield }
  end
end
