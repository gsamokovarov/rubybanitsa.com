Rails.configuration.to_prepare do
  MapHelper.google_api_key = ENV['GOOGLE_API_KEY']
end
