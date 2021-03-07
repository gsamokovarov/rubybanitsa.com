# frozen_string_literal: true

class JoinsController < ApplicationController
  def show
    if current = Event.current and current.online?
      redirect_to current.online_url
    end
  end
end
