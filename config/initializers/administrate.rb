Rails.configuration.to_prepare do
  Admin::ApplicationController.admin_name = ENV['ADMIN_NAME']
  Admin::ApplicationController.admin_password = ENV['ADMIN_PASSWORD']
end
