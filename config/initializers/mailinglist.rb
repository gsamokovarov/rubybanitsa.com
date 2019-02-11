# frozen_string_literal: true

Mailinglist.emails = ENV["MAILING_LIST"]&.split(/\s?,\s?/)
