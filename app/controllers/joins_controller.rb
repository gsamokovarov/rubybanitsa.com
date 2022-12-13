# frozen_string_literal: true

class JoinsController < ApplicationController
  def show
    current = Event.current
    return unless current

    event = EventInfo.new current
    redirect_to current.online_url if event.upcoming_and_online? && event.joinable?
  end
end
