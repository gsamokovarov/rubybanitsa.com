# frozen_string_literal: true

# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    include Administration

    before_action :authenticate_admin

    cattr_accessor :admin_name
    cattr_accessor :admin_password

    private

    def authenticate_admin
      authenticate_or_request_with_http_basic do |name, password|
        ActiveSupport::SecurityUtils.secure_compare(name, admin_name) &
          ActiveSupport::SecurityUtils.secure_compare(password, admin_password)
      end

      admin!
    end
  end
end
