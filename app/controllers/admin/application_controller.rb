# frozen_string_literal: true

module Admin
  class ApplicationController < ::ApplicationController
    cattr_accessor :admin_name
    cattr_accessor :admin_password

    layout -> { turbo_frame_request? ? "turbo_rails/frame" : "admin/application" }

    before_action :authenticate_admin

    private

    def scope(relation) = relation.order(id: :desc).page(params[:page], per_page: params[:per_page] || 50)

    def authenticate_admin
      authenticate_or_request_with_http_basic do |name, password|
        ActiveSupport::SecurityUtils.secure_compare(name, admin_name) &
          ActiveSupport::SecurityUtils.secure_compare(password, admin_password)
      end

      admin!
    end
  end
end
