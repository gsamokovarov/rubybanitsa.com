# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  include MarkdownHelper

  layout "mailer"
end
