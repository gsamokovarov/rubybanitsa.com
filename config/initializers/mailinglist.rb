# frozen_string_literal: true

Rails.configuration.to_prepare do
  Mailinglist.emails = ENV["MAILING_LIST"]&.split(/\s?,\s?/)
end
