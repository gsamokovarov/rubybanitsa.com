Rails.configuration.to_prepare do
  MapHelper.google_api_key =
    ENV.fetch('GOOGLE_API_KEY') do
      "AIzaSyB6mPgfYkFaseJDB7SI9Rv0RwPSg7wPqfg"
    end
end
