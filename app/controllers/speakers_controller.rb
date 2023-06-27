# frozen_string_literal: true

class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.joins(:talks).includes(:talks).order(:name)
  end

  def show
    @speaker = Speaker.find(params[:id])
  end
end
