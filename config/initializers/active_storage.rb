# frozen_string_literal: true

if Rails.env.production?
  Rails.configuration.to_prepare do
    # Hack to force ActiveStorage to generate URLs without the hostname.
    ActiveStorage::BaseController.class_eval do
      before_action do
        ActiveStorage::Current.url_options = { protocol: "https", host: "rubybanitsa.com", port: 443 }
      end
    end
  end
end
