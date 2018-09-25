# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  cattr_accessor :default_sender

  layout "mailer"

  default from: default_sender
end
