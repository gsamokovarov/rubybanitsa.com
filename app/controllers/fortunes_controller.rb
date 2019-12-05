# frozen_string_literal: true

class FortunesController < ApplicationController
  layout "fortunes"

  def show
    @fortune = Fortune.pick
  end
end
