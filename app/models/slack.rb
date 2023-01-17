# frozen_string_literal: true

module Slack
  extend self
  attr_accessor :invite_url

  def invite_url
    @invite_url or raise <<~ERROR
      No invitation link specified. Generate a non-expiring slack invitation
      and pass it here.
    ERROR
  end
end
