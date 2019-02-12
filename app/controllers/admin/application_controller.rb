# frozen_string_literal: true

module Admin
  class ApplicationController < Administrate::ApplicationController
    include Administration

    cattr_accessor :admin_name
    cattr_accessor :admin_password

    before_action :authenticate_admin

    private

    def order
      @order ||= Administrate::Order.new(
        params.fetch(resource_name, {}).fetch(:order, :created_at),
        params.fetch(resource_name, {}).fetch(:direction, :desc),
      )
    end

    def authenticate_admin
      authenticate_or_request_with_http_basic do |name, password|
        ActiveSupport::SecurityUtils.secure_compare(name, admin_name) &
          ActiveSupport::SecurityUtils.secure_compare(password, admin_password)
      end

      admin!
    end
  end
end
