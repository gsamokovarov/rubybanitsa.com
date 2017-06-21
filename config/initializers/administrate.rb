if ENV['ADMIN_NAME'].presence && ENV['ADMIN_PASSWORD'].presence
  Rails.configuration.to_prepare do
    Admin::ApplicationController.admin_name = ENV['ADMIN_NAME']
    Admin::ApplicationController.admin_password = ENV['ADMIN_PASSWORD']
  end
else
  abort "Please provide ADMIN_NAME and ADMIN_PASSWORD environment variables"
end
