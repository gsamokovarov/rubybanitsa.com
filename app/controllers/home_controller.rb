# frozen_string_literal: true

class HomeController < ApplicationController
  def show
    @jobs = Job.current
    if upcoming = Event.upcoming
      redirect_to upcoming
    else
      @events = Event.current
    end
  end
end
