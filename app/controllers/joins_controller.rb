# frozen_string_literal: true

class JoinsController < ApplicationController
  def show
    current = Event.current
    return unless current

    event = EventInfo.new current
    redirect_to event.online_url, allow_other_host: true if event.joinable?
  end
end
