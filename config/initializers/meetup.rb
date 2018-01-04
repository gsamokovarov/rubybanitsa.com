require 'meetup'

Rails.configuration.to_prepare do
  Meetup.client = Meetup.new(ENV['MEETUP_API_KEY'])
end
