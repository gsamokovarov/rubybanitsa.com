require 'early'

Early :development do
  default :ADMIN_NAME, 'admin'
  default :ADMIN_PASSWORD, 'admin'
end

Early do
  default :GOOGLE_API_KEY, 'AIzaSyB6mPgfYkFaseJDB7SI9Rv0RwPSg7wPqfg'

  require :ADMIN_NAME, :ADMIN_PASSWORD
  require :MEETUP_API_KEY
end
