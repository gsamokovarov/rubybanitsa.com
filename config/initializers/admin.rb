# frozen_string_literal: true

Rails.configuration.to_prepare do
  Admin::ApplicationController.admin_name = Settings.admin_name
  Admin::ApplicationController.admin_password = Settings.admin_password
end
