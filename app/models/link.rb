# frozen_string_literal: true

class Link
  class << self
    delegate_missing_to :instance

    private

    def instance
      @instance ||= new
    end
  end

  include Rails.application.routes.url_helpers

  default_url_options[:only_path] = true
end
